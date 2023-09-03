# thunderpath

<p align="center">
    <em>Probabilistic modeling framework to define, experiment with, and critique models in service of iterating through Box's loop.</em>
</p>

[![build](https://github.com/cameronraysmith/thunderpath/workflows/Build/badge.svg)](https://github.com/cameronraysmith/thunderpath/actions)
[![codecov](https://codecov.io/gh/cameronraysmith/thunderpath/branch/main/graph/badge.svg)](https://codecov.io/gh/cameronraysmith/thunderpath)
[![PyPI version](https://badge.fury.io/py/thunderpath.svg)](https://badge.fury.io/py/thunderpath)

---

**Documentation**: <a href="https://cameronraysmith.github.io/thunderpath/" target="_blank">https://cameronraysmith.github.io/thunderpath/</a>

**Source Code**: <a href="https://github.com/cameronraysmith/thunderpath" target="_blank">https://github.com/cameronraysmith/thunderpath</a>

---

## Usage

[thunderpath](https://github.com/cameronraysmith/thunderpath) is pre-development. Please see the document outlining the [specification proposal](https://cameronraysmith.github.io/thunderpath/specification).

## Installation

```console
python -m pip install "thunderpath @ git+https://github.com/cameronraysmith/thunderpath.git@main"
```

## Development

### Setup environment

We use [hatch](https://hatch.pypa.io/latest/install/) to manage the development environment and production build. Ensure it's installed on your system. It is often convenient to do this with [pipx](https://pypa.github.io/pipx/installation/).

### Run unit tests

You can run all the tests with:

```bash
hatch run test
```

### Format the code

Execute the following command to apply linting and check typing:

```bash
hatch run lint
```

### Publish a new version

You can check the current version with:

```bash
hatch version
```

You can bump the version, create a commit and associated tag with one command such as `hatch version patch` or `minor` or `major`. Your git default text editor will open so you can add information about the release.

When you push the tag on github, the workflow will automatically publish it on PyPI and a github release will be created as draft.

## Serve the documentation

You can serve the mkdocs documentation with:

```bash
hatch run docs-serve
```

It'll automatically watch for changes in your code.

## License

This project is licensed under the terms of the GNU Affero 3.0-only license.
