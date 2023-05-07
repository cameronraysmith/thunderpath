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

