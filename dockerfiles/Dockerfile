# syntax=docker/dockerfile:1
FROM ghcr.io/iterative/cml:0-dvc2-base1-gpu

LABEL maintainer="pyro-thunder team"
WORKDIR ${CML_RUNNER_PATH}
COPY . pyro-thunder/
RUN cd pyro-thunder && \
    pip install -e .