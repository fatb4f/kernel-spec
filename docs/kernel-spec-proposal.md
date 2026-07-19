# Kernel Spec

## Base semantic compiler specification proposal

| Field | Value |
|---|---|
| Status | Bootstrap seed for architecture review |
| Scope | Machine-readable specification model and semantic compiler-kernel contracts |
| Source language | CUE plus the Kernel Spec metamodel |
| Canonical authority | Model A semantic closure |
| Derived API model | Model B |
| Initial downstream profile | OSCAL agentic GitOps controller |

## 1. Purpose

Kernel Spec defines the base CUE data model required to implement a semantic compiler kernel.

It is not initially the compiler implementation. It specifies the compiler's source objects, stages, invariants, intermediate models, projection contracts, conformance rules, and qualification surfaces so that the first implementation can be written against an executable contract rather than prose.

CUEstrap remains upstream and retains its original role: discovering and qualifying idiomatic CUE patterns against pinned `cue-lang/cue` authority. Kernel Spec consumes those patterns and composes them into a reusable system-level metamodel.

## 2. Compiler architecture

```text
Model A — canonical machine-readable specification graph
    ├── definitions and structural constraints
    ├── requirements and enforcement mechanisms
    ├── resources and semantic relations
    ├── states, transitions, and protocols
    ├── procedures and qualification
    ├── projects and controllers
    ├── controller/project bindings
    ├── projection manifests
    ├── conformance classes
    └── compiler definitions
          ↓ deterministic typed compilation
Derived IR family
    ├── Model B API IR
    ├── OSCAL lifecycle/governance IR
    ├── evaluation IR
    ├── runtime/controller IR
    └── documentation IR
          ↓ deterministic projection
OpenAPI / OSCAL / MCP / CLI / SDK / docs / tests
```

Only Model A is semantically authored.

## 3. Normative completeness

The central invariant is:

> No normative semantic may exist exclusively in prose.

Every normative statement must resolve through a machine-addressable chain:

```text
requirement ID
    → semantic subject
    → modality
    → declarative, procedural, or observational enforcement
    → evidence obligation
    → conformance class
    → conformance result
```

Documentation is a projection of these objects. It may explain them, but it may not silently create new requirements, transitions, protocol phases, projection obligations, or conformance rules.

## 4. Project and controller separation

A project and a controller are sibling first-class specifications.

```text
ProjectSpec
    defines the governed domain, resources, states, policy, and acceptance criteria.

ControllerSpec
    defines reusable observation, decision, procedure, operation, and effect capabilities.

ControllerProjectBinding
    narrows one controller to one project under exact revisions and authority.
```

Effective authority is the intersection of:

```text
controller-declared capability
∩ project-permitted capability
∩ binding-delegated capability
∩ current policy
∩ current posture
```

A controller never acquires project authority merely because both are declared in the same module.

## 5. Model A

Model A is a machine-readable specification graph, not merely a set of data schemas. It must contain addressable objects for definitions, requirements, resources, relations, operations, states, transitions, protocols, procedures, conformance classes, projects, controllers, bindings, projections, and compiler definitions.

CUE owns unification, bottom, subsumption, defaults, conditional constraints, comprehensions, and closure.

## 6. Model B

Model B is a generated transport-neutral API model containing data types, resources, operations, messages, events, errors, security references, and exact Model A/compiler source coordinates.

Model B owns no independently authored meaning. Editing generated Model B is prohibited once generation exists.

Model B is one member of a derived IR family. OSCAL and other semantically richer targets need not be forced through an API-shaped bottleneck.

## 7. External schema imports

External schema languages are import front ends.

The JSON Structure profile is equivalent in architectural role to:

```text
cue import json-structure.json
```

Conceptually:

```text
JSON Structure source
    → parse and resolve pinned language profile
    → validate source vocabulary
    → lower supported constructs to idiomatic CUE
    → preserve provenance
    → reject undeclared loss
    → unify into Model A
```

JSON Structure does not introduce a second evaluator. CUE remains canonical.

## 8. Compiler stages

The initial stage algebra is:

1. **ingest** — receive CUE modules and supported external schema inputs;
2. **resolve** — resolve modules, namespaces, revisions, imports, and extensions;
3. **normalize** — canonicalize identities, references, defaults, and ordering;
4. **unify** — compose kernel, project, controllers, bindings, and extensions;
5. **evaluate** — detect bottom, incomplete values, and violated relations;
6. **qualify** — execute declared properties and qualified procedures;
7. **freeze** — close intended authority apertures and content-address the closure;
8. **lower** — produce typed projection-specific IRs;
9. **project** — materialize external artifacts;
10. **verify** — validate targets and preservation obligations.

## 9. Compiler properties

The kernel specification must support executable properties for deterministic output, semantic closure, traceability, explicit projection loss, qualified extension admission, acyclic materialization, reproducible revision binding, semantic preservation, and rejection of downstream drift.

## 10. Extension semantics

A qualified extension contributes to Model A through an explicit namespace aperture.

```text
A(n+1) = resolve(K ∧ P ∧ C* ∧ B* ∧ E*)
```

Subject to:

```text
A(n+1) != bottom
extension dependency graph is acyclic
external profiles are revision-pinned
authority expansion is explicitly authorized
```

Compatibility distinguishes semantic refinement, additive vocabulary, additive API surface, restrictive change, semantic reinterpretation, removal, and authority narrowing or expansion.

## 11. Bootstrap model

The apparent compiler cycle is resolved by separating specification from implementation.

```text
Stage 0: pinned CUE parser and evaluator
Stage 1: K0, minimal hand-authored CUE metamodel
Stage 2: C0, hand-written compiler implementing K0 contracts
Stage 3: K1, richer self-describing model
Stage 4: C1, increasingly model-driven compiler
Stage N: self-hosting fixed point
```

Self-hosting is reached when the bootstrap and self-hosted compilers produce semantically equivalent canonical outputs for the kernel specification.

## 12. Initial completion gate

The initial Kernel Spec seed is sufficient when it can express and validate Model A and Model B identities, normative requirements and enforcement, projects/controllers/bindings, states/transitions/operations/protocols, procedures and conformance classes, compiler/importer/projection contracts, the JSON Structure import profile, the OSCAL governed-project profile, the OSCAL agentic GitOps controller profile, and the binding between that controller and project.

The first implementation can then target this executable base rather than reconstructing the architecture from prose.
