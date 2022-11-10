# Syntax

## Table of contents
- [Syntax](#syntax)
  - [Directory Overview](#directory-overview)
    - [Definitions](#definitions)
  - [General Syntax Notes](#general-syntax-notes)
  - [Goals](#goals)
    - [Non-Goals](#non-goals)
  - [Possible Solutions](#possible-solutions)

## Directory Overview
Each ".mu" file in this directory demonstrates a different potential syntaxes.
Additionally, there are some 'examples' from many other languages that would
be effectively equivalant. The 'examples' will ignore their respective
standard libraries. They will all define (effectively) the same things with
the same properties, although the names are subject to change, primarily due
to convention.

Throughout this README, all type-variables and type-parameters are written as
one lowercase letter. They may represent any type, although those with the
name must represent the same type throughout the scope of each definition.

### Definitions
They will each define the following:
- Datatypes:
    - `Boolean`
        - 2 constructors
            - `True`
            - `False`
    - `List`
        - A linked-list
        - 1 type-parameter (`a`)
        - 2 constructors
            - `Empty`
                - Represents an empty list
            - `Node`
                - Represents a "link" to the rest of the list
                - Member types: `a`, `List`
    - `Choice`
        - Represents a value that is one of two types
        - 2 type-parameters (`a` and `b`)
        - 2 constructors
            - `First`
                - Represents a value of the first type
                - Member types: `a`
            - `Second`
                - Represents a value of the second type
                - Member types: `b`
- Functions:
    - `if`
        - Takes 3 parameters
            - `cond`: a `Boolean` condition
            - `true`: the value to return if `cond` is `True`
            - `false`: the value to return if `cond` is `False`
        - Returns a value of type `a`
    - `elimChoice`
        - Takes 3 parameters
            - `af`: a function mapping types `a` to `c`
            - `bf`: a function mapping types `b` to `c`
            - `choice`: a `Choice` with types `a` and `b` as arguments
        - Returns a value of type `c`
            - Calculated by the following algorithm:
                1. If `choice` is the `First` constructor, apply `af` to its
                held value
                2. Otherwise, apply `bf` to the constructor's held value (the
                constructor must be `Second`)
- Traits:
    - `Functor`
        - `f` is a functor if you can apply any function that maps `a` to `b`
        to it, transforming `f a` into `f b`
        - Methods:
            - `map`
                - Takes 2 parameters:
                    - `f`: a function that maps `a` to `b`
                    - `x`: the functor itself

## General Syntax Notes
- Capitalization
    - Tokens that must start with a lower-case letter:
        - Collectively referred to as "Variables"
        - Type variables (i.e. `a`, `b`)
        - Functions (i.e. `elimChoice`)
        - Variables/parameters
    - Tokens that must start with an upper-case letter:
        - Collectively referred to as "constructors"
        - Type constructors (i.e. `String`, `Choice`, `List`, `Int`)
        - Data constructors (i.e. `First`, `Empty`)
    - Rational: Distinguishes constructors from variables in pattern matching

## Goals
1. Whitespace insensitive
    - Absolute.
2. Minimal/Simplistic
3. "Unified" function declaration and definition
4. Minimal "special" syntax
    - i.e. no `[a]` for a list type, no "do-notation"
3. Purely Functional

### Non-Goals
- Syntactic sugar (but maybe in the future)
    - Parameter patterns
        - Rational: Unifying the parameters is cumbersome.

## Possible Solutions
- [Option 1](/doc/design/Syntax/Option1.mu)
    - Primary inspiration: Rust
    - Goals met: 1, 3, 4, 3
    - Notes:
        - Looks convoluted and chaotic
            - Maybe its just the lack of syntax highlighting
- [Option 2](/doc/design/Syntax/Option2.mu)
    - Primary inspiration: Haskell
    - Goals met: 1, 4, 3
    - Notes:
        - The inconsistency between datatype definitions and traits/functions
        is very unfavorable
