# GitHub Reusable Workflows

This repository have reusable workflows for building a SLSA level 3
secure software supply chain.

The following figure illustrates [SLSA Supply chain
threats](https://slsa.dev/spec/v1.0/threats-overview):

![SLSA Supply chain threats](docs/images/slsa-threats.png)

See [example application
pository](https://github.com/michaelvl/sigstore-in-toto-workshop) for
an example use of the workflows from this repositoty.

## Protections

Mitigation of threats as described by SLSA are described below.

Legend

- :memo: Attestation or other metadata produced/used by workflows.
- :no_entry: Control/governance point, i.e. decision point for accepting artifacts.
- :tophat: Trusted process through separation of duties.
- :x: No mitigation

Mitigation mechanisms:

- A. Submit unauthorized source:
  - :memo: PR provenance attestation showing PR status, who reviewed, approved and merged etc.
  - TODO: Investigate [Gittuf](https://github.com/gittuf/gittuf)
- B. Compromised source repository:
  - :x: None
  - TODO: Produce Git signature attestation
- C. Build from modified source
  - :x: None
  - TODO: Produce Git signature attestation
- D. Compromised dependencies
  - :memo: SBOM attestation
  - :memo: Container CVE scan attestation
- E. Compromised build process
  - :tophat: Separated workflows using GitHub [reusable workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
  - :memo: SLSA provenance using the [slsa-github-generator](https://github.com/slsa-framework/slsa-github-generator)
  - :memo: Organization policies applied and produce [Verification Summary Attestation (VSA)](https://slsa.dev/spec/v1.0/verification_summary)
- F. Upload modified artifacts
  - :memo: Container digest used throughout workflows
  - :memo: Container signed
- G. Compromised artifact storage
  - :memo: Container digest used throughout workflows
  - :memo: Container signed
- H. Deploy compromised artifact
  - :memo: Container digest used to identify container artifact
  - :memo: Container signed
  - :no_entry: [Sigstore policy controller policies](https://github.com/sigstore/policy-controller)

Note, that SLSA levels describe the build-phase and does not cover the
source-phase, i.e. tampering with the source prior to building.

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
