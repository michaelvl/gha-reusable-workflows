.PHONY: check-action-pinning
check-action-pinning:
	for wflow in $$(find .github/workflows -name '*.yaml'); do \
	  ratchet pin -out pinned.yaml $$wflow; \
	  diff $$wflow pinned.yaml; \
	done
