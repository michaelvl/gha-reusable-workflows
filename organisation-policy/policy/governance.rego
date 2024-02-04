package governance

default allow = false

provenance_attestations :=
    [att | json.unmarshal(input[i].Attestation).predicateType == "https://slsa.dev/provenance/v0.2"; att := json.unmarshal(input[i].Attestation)]

sbom_attestations :=
    [att | json.unmarshal(input[i].Attestation).predicateType == "https://spdx.dev/Document"; att := json.unmarshal(input[i].Attestation)]

vuln_attestations :=
    [att | json.unmarshal(input[i].Attestation).predicateType == "https://cosign.sigstore.dev/attestation/vuln/v1"; att := json.unmarshal(input[i].Attestation)]


allow {
    violations := provenance_violations | sbom_violations | vuln_violations
    print(violations)
    count(violations) == 0
}

provenance_violations[msg] {
    count(provenance_attestations) == 0
    msg:= "no provenance attestation"
}

sbom_violations[msg] {
    count(sbom_attestations) == 0
    msg:= "no sbom attestation"
}

vuln_violations[msg] {
    count(vuln_attestations) == 0
    msg:= "no vuln attestation"
}
