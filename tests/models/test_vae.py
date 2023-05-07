import pyro
import pyro.poutine
import pytest
import torch

from thunder.models.vae import VAE
from thunder.plots.models import plot_latent_space, plot_loss


# Define a fixture to create a VAE instance
@pytest.fixture
def vae():
    input_dim = 100
    hidden_dim = 50
    z_dim = 20
    return VAE(input_dim, hidden_dim, z_dim)


def test_encoder(vae):
    x = torch.randn(32, 100)
    mu, log_var = vae.encoder(x)
    assert mu.size() == (32, 20)
    assert log_var.size() == (32, 20)


def test_decoder(vae):
    z = torch.randn(32, 20)
    x_loc, x_scale = vae.decoder(z)
    assert x_loc.size() == (32, 100)
    assert x_scale.size() == (32, 100)


@pytest.mark.parametrize("batch_size", [1, 16, 32, 64])
def test_guide(vae, batch_size):
    x = torch.randn(batch_size, 100)
    with torch.no_grad():
        # Use pyro.poutine.trace to record the execution trace while running the guide function
        with pyro.poutine.trace() as guide_trace:
            vae.guide(x)

    # Access the recorded trace from the guide_trace object
    trace = guide_trace.trace
    assert "latent" in {site["name"] for site in trace.nodes.values()}


@pytest.mark.parametrize("batch_size", [1, 16, 32, 64])
def test_model(vae, batch_size):
    x = torch.randn(batch_size, 100)
    with torch.no_grad():
        # Use poutine.trace to get the trace of the model function
        trace = pyro.poutine.trace(vae.model).get_trace(x)
    assert "latent" in {site["name"] for site in trace.nodes.values()}
    assert "obs" in {site["name"] for site in trace.nodes.values()}


def training_step(self, batch, batch_idx):
    x, _ = batch
    pyro.clear_param_store()
    svi_step = pyro.infer.SVI(self.model, self.guide, self.optim, self.elbo)
    loss = torch.tensor(svi_step.step(x))
    self.log("train_loss", loss)
    return loss


def test_configure_optimizers(vae):
    optimizer = vae.configure_optimizers()
    assert isinstance(optimizer, pyro.optim.PyroOptim)


def test_visualizations(vae):
    plot_loss(vae, num_epochs=100, output_file="tests/output/loss_plot.pdf")
    plot_latent_space(vae, output_file="tests/output/latent_space_plot.pdf")
