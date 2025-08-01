(lang dune 3.8)
(name mel-bastet)
(source (github johnhaley81/mel-bastet))
(license BSD-3-Clause)
(authors "John Haley")
(maintainers "john@haley.io")
(generate_opam_files false) ;disable while pinning melange deps
(implicit_transitive_deps false)
(using melange 0.1)
(using mdx 0.3)

(package
 (name mel-bastet)
 (synopsis "A Melange-focused fork of Bastet for category theory and abstract algebra")
 (documentation "https://johnhaley81.github.io/mel-bastet")
 (tags
  ("category theory" "abstract algebra" "algebra" "cats"))
 (depends
  (ocaml (>= 4.14))
  (alcotest (and (>= 1.0.1) :with-test))
  (qcheck (and (and (>= 0.13) (< 0.18)) :with-test))
  (qcheck-alcotest (and (and (>= 0.13) (< 0.18)) :with-test))
  (mdx (and (>= 1.6.0) :with-test))
  (odoc (and (>= 1.5.0) :with-doc))
  (mustache (and (>= 3.1.0) :with-doc))
  (dune (>= 3.0))
  (melange (>= 1.0.0))))
