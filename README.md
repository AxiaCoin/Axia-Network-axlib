# Axlib &midaxc; [![GitHub license](https://img.shields.io/badge/license-GPL3%2FApache2-blue)](#LICENSE) [![GitLab Status](https://gitlab.axiacoin.network/axia/axlib/badges/master/pipeline.svg)](https://gitlab.axiacoin.network/axia/axlib/pipelines) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](docs/CONTRIBUTING.adoc) [![Matrix](https://img.shields.io/matrix/axlib-technical:matrix.org)](https://matrix.to/#/#axlib-technical:matrix.org)

<p align="center">
  <img src="/docs/media/sub.gif">
</p>

Axlib is a next-generation framework for blockchain innovation 🚀.

## Trying it out

Simply go to [docs.axlib.io](https://docs.axlib.io) and follow the
[installation](https://docs.axlib.io/v3/getting-started/overview) instructions. You can
also try out one of the [tutorials](https://docs.axlib.io/tutorials/).

## Contributions & Code of Conduct

Please follow the contributions guidelines as outlined in [`docs/CONTRIBUTING.adoc`](docs/CONTRIBUTING.adoc). In all communications and contributions, this project follows the [Contributor Covenant Code of Conduct](docs/CODE_OF_CONDUCT.md).

## Security

The security policy and procedures can be found in [`docs/SECURITY.md`](docs/SECURITY.md).

## License

- Axlib Primitives (`sp-*`), Frame (`frame-*`) and the pallets (`pallets-*`), binaries (`/bin`) and all other utilities are licensed under [Apache 2.0](LICENSE-APACHE2).
- Axlib Client (`/client/*` / `sc-*`) is licensed under [GPL v3.0 with a classpath linking exception](LICENSE-GPL3).

The reason for the split-licensing is to ensure that for the vast majority of teams using Axlib to create feature-chains, then all changes can be made entirely in Apache2-licensed code, allowing teams full freedom over what and how they release and giving licensing clarity to commercial teams.

In the interests of the community, we require any deeper improvements made to Axlib's core logic (e.g. Axlib's internal consensus, crypto or database code) to be contributed back so everyone can benefit.

