# Code for "Real World OCaml"

This repository contains code I wrote while going through the [Real World OCaml](https://realworldocaml.org/) book.
Some of it was just rewritten from the book, some I wrote myself.

Code presented here may be useful if the examples from Real World OCaml do not work on your machine.
Most probably it is due to the fact that the book (at least the edition I have) was published in 2013-2014, and
OCaml has evolved (and broke some APIs) since then.

The original repository with example code can be found [here](https://github.com/realworldocaml/examples).


----

### Incompatibilities with newer versions of OCaml or Core

In cases where the OCaml or Core library changed since the book was published I updated the code to compile with
newer versions:

- OCaml 4.05.0
- Core v0.9.0

Suitable comments are embedded in changed files, highlighting places when fixes were needed.


----

### Compilation

The repository is divided into parts and chapters the same way the book is.
Every chapter directory contains a `Makefile` that, when executed, will compile the examples.
Additionally, the files themselves sometimes embed instructions what to do with them (some are
intended to be run under `utop`).


----

### Copyright

Examples copied verbatim from the book are:

> 2014 (C) Yaron Minsky, Anil Madhavapeddy, Jason Hickey

Since my "fixed" examples are deriative works, I don't know if I may claim copyright.
But in case I do, this code is Free Software published under GNU GPL v3 or any later version
of this license.
