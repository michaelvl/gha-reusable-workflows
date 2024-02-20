package governance_test

import data.governance.allow

test_all_pass {
	case := [data.test.prov, data.test.sbom, data.test.vuln, data.test.pr]
	allow with input as case
}

test_fail_no_provenance {
    case := [data.test.sbom, data.test.vuln, data.test.pr]
    not allow with input as case
}

test_fail_no_sbom {
    case := [data.test.prov, data.test.vuln, data.test.pr]
    not allow with input as case
}

test_fail_no_vuln {
    case := [data.test.prov, data.test.sbom, data.test.pr]
    not allow with input as case
}

test_fail_no_pr {
    case := [data.test.prov, data.test.sbom, data.test.vuln]
    not allow with input as case
}
