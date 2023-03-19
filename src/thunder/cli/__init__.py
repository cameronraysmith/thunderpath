# SPDX-FileCopyrightText: 2023-present biotheorylab
#
# SPDX-License-Identifier: MIT
import click

from thunder.__about__ import __version__


@click.group(context_settings={"help_option_names": ["-h", "--help"]}, invoke_without_command=True)
@click.version_option(version=__version__, prog_name="thunder")
def main():
    click.echo("make pyro thunder!")
