package bootstrap

import ks "github.com/fatb4f/kernel-spec/spec:kernelspec"

zero: "sha256:0000000000000000000000000000000000000000000000000000000000000000"

kernel: ks.#CompilerKernel & {
	identity: {
		id:       "kernel-spec-bootstrap"
		revision: zero
	}

	modelKinds: {
		"model-a": {
			id:            "model-a"
			description:   "Canonical CUE-native machine-readable specification graph"
			authoritative: true
		}
		"model-a-fragment": {
			id:            "model-a-fragment"
			description:   "Imported contribution awaiting unification into Model A"
			authoritative: false
		}
		"model-b": {
			id:            "model-b"
			description:   "Derived transport-neutral API model"
			authoritative: false
		}
	}

	features:    {}
	compilers:   {}
	importers:   {}
	projections: {}
}
