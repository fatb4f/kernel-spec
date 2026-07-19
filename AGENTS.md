# kernel-spec agent contract

## Purpose

This repository defines and qualifies the base CUE specification model required to implement the semantic compiler kernel. It is not the CUEstrap pattern laboratory and it is not yet the production controller runtime.

## Authority

1. Pinned upstream CUE semantics are external authority.
2. `spec/` is the canonical machine-readable kernel specification.
3. `profiles/` may refine or instantiate `spec/`; profiles may not redefine base semantics.
4. `docs/` explains and projects the CUE authority. Normative meaning must not originate only in prose.
5. Generated artifacts and runtime observations are non-authoritative descendants.

## Editing constraints

- Preserve the Model A / derived-IR boundary.
- Keep project, controller, and controller/project binding as separate first-class concepts.
- Declare every authority expansion explicitly.
- Represent requirements, transitions, protocols, conformance classes, compiler stages, and projection loss as addressable data.
- Keep external schema languages as import or projection profiles; CUE remains the evaluator.
- Do not hand-edit generated descendants once generation exists.
- Add positive and negative fixtures for each semantic change.

## Bootstrap discipline

The initial implementation may be hand-written, but its accepted inputs, outputs, preconditions, postconditions, preservation properties, losses, and receipts must be modeled here first.

## Required checks

```sh
cue vet ./...
cue eval ./examples/bootstrap
cue eval ./tests/positive
```
