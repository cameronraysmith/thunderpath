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
