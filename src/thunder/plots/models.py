import os

import matplotlib.pyplot as plt
import pyro.distributions as dist
import torch


def plot_loss(vae, num_epochs, output_file):
    losses = []
    for _ in range(num_epochs):
        x = torch.randn(32, 100)
        y = torch.randint(0, 2, (32,))
        loss = vae.training_step((x, y), 0)
        losses.append(loss)

    plt.plot(losses)
    plt.xlabel("Epoch")
    plt.ylabel("Loss")
    plt.title("Training Loss")
    plt.savefig(output_file)
    plt.close()
    assert os.path.isfile(output_file)


def plot_latent_space(vae, output_file):
    x = torch.randn(1000, 100)
    with torch.no_grad():
        z_loc, z_scale = vae.encoder(x)
        z = dist.Normal(z_loc, torch.nn.functional.softplus(z_scale)).sample()
        plt.scatter(z[:, 0], z[:, 1], alpha=0.5)
        plt.xlabel("Latent Dimension 1")
        plt.ylabel("Latent Dimension 2")
        plt.title("Latent Space")
        plt.savefig(output_file)
        plt.close()
    assert os.path.isfile(output_file)
