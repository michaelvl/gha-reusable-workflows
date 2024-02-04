package governance_test

import data.governance.allow

test_all_pass {
	case := [data.test.provenance.orig, data.test.sbom.orig, data.test.vuln.orig]
	allow with input as case
}

test_fail_no_provenance {
    case := [data.test.sbom.orig, data.test.vuln.orig]
    not allow with input as case
}

test_fail_no_sbom {
    case := [data.test.provenance.orig, data.test.vuln.orig]
    not allow with input as case
}

test_fail_no_vuln {
    case := [data.test.provenance.orig, data.test.sbom.orig]
    not allow with input as case
}
