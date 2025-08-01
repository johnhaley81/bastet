# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Mel-Bastet** is a Melange-focused fork of [Bastet](https://github.com/Risto-Stevcev/bastet), optimized for JavaScript compilation.

## Commands

### Build Commands
- `make build` - Build the project using dune
- `opam exec -- dune build @all` - Direct dune build command
- `make watch` - Watch mode for continuous building
- `opam exec -- dune build @all -w` - Direct dune watch command

### Test Commands
- `make test` - Run all tests (includes build step)
- `opam exec -- dune runtest --no-buffer` - Direct dune test command
- `make watch-test` - Watch mode for continuous testing
- `opam exec -- dune runtest --no-buffer -w` - Direct dune watch test

### JavaScript/Melange
- `dune build` - Build including JavaScript target via Melange
- `dune runtest` - Run all tests including JavaScript tests

### Code Formatting
- `make fmt` - Format code using ocamlformat
- `opam exec -- dune build @fmt --auto-promote` - Direct dune format command

### Documentation
- `make docs` - Generate documentation
- `make copy-docs` - Build and copy docs to docs/ directory
- `make open-docs` - Build docs and open in browser

### Development Environment
- `make utop` - Start utop REPL with project loaded
- `make default-switch` - Create opam switch with all dependencies

## Architecture

### Project Structure
Mel-Bastet is a Melange-focused fork of the original Bastet library, specializing in category theory and abstract algebra with optimized JavaScript compilation:

**Core Library (`bastet/`):**
- Native OCaml implementation using dune
- Provides mathematical abstractions: Functors, Monads, Semigroups, etc.
- Type interfaces defined in `Interface.ml`
- Pre-instantiated functors in `Functors.ml`

**JavaScript Target (`bastet_js/`):**
- Uses Melange for JavaScript compilation
- Extends core library with JavaScript-specific implementations
- Includes `JsArray`, `JsFloat`, `Promise`, etc.

### Key Modules
- `Interface.ml` - Defines all type class interfaces (FUNCTOR, MONAD, SEMIGROUP, etc.)
- `Functors.ml` - Pre-instantiated common functors (ArrayF, ListF, OptionF, ResultF, etc.)
- Individual modules like `Array.ml`, `Option.ml`, `Result.ml` implement type class instances
- `Verify.ml` - Property-based test utilities for mathematical laws

### Build System
- dune + opam for both native OCaml and JavaScript (via Melange) targets
- Makefile provides convenient commands wrapping dune/opam

### Testing
- Native tests use Alcotest and QCheck
- JavaScript tests use Mocha and JSVerify
- Tests verify mathematical laws and properties
- Coverage reporting with bisect_ppx

## Development Notes

### Fork Information
This is a fork of the original Bastet library, focused on Melange for JavaScript compilation:
- Maintains the original Bastet API and structure
- Optimized for JavaScript compilation via Melange
- Removes BuckleScript legacy code and dependencies
- Core logic remains in `bastet/` (native)
- JavaScript-specific extensions in `bastet_js/`

### Mathematical Laws
All type class implementations must satisfy their mathematical laws. Use the `Verify` module and property-based testing when adding new instances.

### Functor Pattern
The library heavily uses OCaml's module functor system to provide reusable implementations. See `Functors.ml` for examples of pre-instantiated common patterns.