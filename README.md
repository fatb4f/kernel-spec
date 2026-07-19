# kernel-spec

`kernel-spec` defines the machine-readable CUE specification model used to bootstrap a semantic compiler kernel.

It is downstream of [CUEstrap](https://github.com/fatb4f/cuestrap): CUEstrap remains the narrow upstream-alignment and pattern-qualification laboratory; this repository composes qualified CUE patterns into a reusable specification and compiler model.

## Scope

The repository owns:

- **Model A** — the canonical, CUE-native machine-readable specification graph;
- **Model B** — the derived transport-neutral API model;
- compiler, importer, lowering, projection, and verification contracts;
- project, controller, and controller/project binding semantics;
- conformance, qualification, provenance, and compatibility semantics;
- the OSCAL agentic GitOps controller as a downstream profile.

The repository does not yet implement the compiler kernel. Its initial deliverable is the base data model from which the first implementation can be built.

## Authority chain

```text
cue-lang/cue
    ↓
CUEstrap qualified patterns and kernel primitives
    ↓
kernel-spec Model A
    ↓ deterministic compilation
projection-specific IRs, including Model B
    ↓
OpenAPI / OSCAL / MCP / CLI / SDK / documentation / tests
```

No normative information may originate below Model A.

## Repository map

```text
spec/                           canonical base metamodel
profiles/import/json-structure/ JSON Structure import profile
profiles/oscal-agentic-gitops/  governed project, controller, and binding profile
examples/bootstrap/             minimal resolved bootstrap instance
tests/positive/                 admitted fixture instances
docs/                           architecture and migrated proposal
```

## Validation

Use the pinned CUE toolchain inherited from the CUEstrap release bundle, then run:

```sh
cue vet ./...
cue eval ./examples/bootstrap
cue eval ./tests/positive
```

## Bootstrap sequence

```text
K0  hand-authored CUE metamodel
C0  hand-written compiler implementation
K1  richer self-describing specification model
C1  model-driven compiler implementation
…
Kn  self-hosting kernel fixed point
```
