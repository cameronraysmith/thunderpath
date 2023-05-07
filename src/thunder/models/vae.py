import lightning as pl
import pyro
import pyro.distributions as dist
import torch
from torch import nn


class Encoder(nn.Module):
    def __init__(self, input_dim, hidden_dim, z_dim):
        super().__init__()
        self.fc1 = nn.Linear(input_dim, hidden_dim)
        self.fc21 = nn.Linear(hidden_dim, z_dim)
        self.fc22 = nn.Linear(hidden_dim, z_dim)
        self.z_dim = z_dim

    def forward(self, x):
        h1 = torch.relu(self.fc1(x))
        return self.fc21(h1), self.fc22(h1)


class Decoder(nn.Module):
    def __init__(self, z_dim, hidden_dim, output_dim):
        super().__init__()
        self.fc1 = nn.Linear(z_dim, hidden_dim)
        self.fc2_loc = nn.Linear(hidden_dim, output_dim)
        self.fc2_scale = nn.Linear(hidden_dim, output_dim)

    def forward(self, z):
        h1 = torch.relu(self.fc1(z))
        loc = self.fc2_loc(h1)
        scale = torch.exp(self.fc2_scale(h1))  # Ensure positive scale values
        return loc, scale


class VAE(pl.LightningModule):
    def __init__(self, input_dim, hidden_dim, z_dim):
        super().__init__()
        self.encoder = Encoder(input_dim, hidden_dim, z_dim)
        self.decoder = Decoder(z_dim, hidden_dim, input_dim)
        self.z_dim = z_dim
        self.optim = pyro.optim.Adam({"lr": 1e-3})
        self.elbo = pyro.infer.Trace_ELBO()

    def guide(self, x):
        with pyro.plate("data", x.shape[0]):
            loc, log_var = self.encoder(x)
            std = torch.exp(0.5 * log_var)
            pyro.sample("latent", dist.Normal(loc, std).to_event(1))

    def model(self, x):
        with pyro.plate("data", x.shape[0]):
            z_loc = x.new_zeros(torch.Size((x.shape[0], self.encoder.z_dim)))
            z_scale = x.new_ones(torch.Size((x.shape[0], self.encoder.z_dim)))
            z = pyro.sample("latent", dist.Normal(z_loc, z_scale).to_event(1))
            x_loc, x_scale = self.decoder(z)
            pyro.sample("obs", dist.Normal(x_loc, x_scale).to_event(1), obs=x)

    def training_step(self, batch, batch_idx):
        x, _ = batch
        pyro.clear_param_store()
        svi_step = pyro.infer.SVI(self.model, self.guide, self.optim, self.elbo)
        loss = svi_step.step(x)
        # if getattr(self, 'trainer', None) is not None:
        #     self.log("train_loss", loss)
        return loss

    def configure_optimizers(self):
        self.optim = pyro.optim.Adam({"lr": 1e-3})
        self.elbo = pyro.infer.Trace_ELBO()
        return self.optim
