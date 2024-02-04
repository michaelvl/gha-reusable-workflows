# GitHub Reusable Workflows

This repository have reusable workflows for building a SLSA level 3
secure software supply chain.

See e.g. [SLSA Supply chain threats](https://slsa.dev/spec/v1.0/threats-overview):

![SLSA Supply chain threats](docs/images/slsa-threats.png)

See also [example application pository](https://github.com/michaelvl/sigstore-in-toto-workshop).

## Protections

Note, that SLSA focus on the build-phase and does not cover source,
i.e. tampering with the source prior to building.

## Links

- GitHub attacks and protections
  * GitHub attack tree: [SLSA dip — At the Source of the problem!](https://boostsecurity.io/blog/slsa-dip-at-the-source-of-the-problem)
  * [Using SSH does not imply Git integrity](https://github.com/michaelvl/git-signature-checker)
  * GitHub action pinning [ratchet](https://github.com/sethvargo/ratchet)
- Signing artifacts:
  * [Cosign](https://github.com/sigstore/cosign)
    - [Race condition when creating multiple signatures](https://github.com/sigstore/cosign#registry-details)
  * [Gitsign](https://github.com/sigstore/gitsign)
  * [provenance generation and verifying attestation using cosign with new predicate type](https://github.com/sigstore/gitsign/issues/105)
- [Spicing up Container Image Security with SLSA & GUAC - Ian Lewis, Google](https://www.youtube.com/watch?v=32IhwdAe0yI)
- [Supply-chain Levels for Software Artifacts, SLSA](https://slsa.dev)
- Inspiration:
  * [github.com/liatrio/gh-trusted-builds-workflow](https://github.com/liatrio/gh-trusted-builds-workflow)
