# syntax=docker/dockerfile:1
FROM condaforge/mambaforge:23.1.0-4@sha256:0cee8f92cffaf991c0250c10da5db4bf9e4718f65a96f164b5a72d57a5fb60c4
WORKDIR /thunderpath
COPY . .

RUN mamba init
RUN mamba info && \
    mamba install python=3.10 --yes
RUN pip install -e .
