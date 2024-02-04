.PHONY: check-action-pinning
check-action-pinning:
	for wflow in $$(find .github/workflows -name '*.yaml'); do \
	  ratchet pin -out pinned.yaml $$wflow; \
	  diff $$wflow pinned.yaml; \
	done

.PHONY: policy-bundle-build
policy-bundle-build:
	opa build organisation-policy/policy/ -o bundle.tar.gz

.PHONY: policy-bundle-test
policy-bundle-test:
	cd organisation-policy/ && opa test -v .
