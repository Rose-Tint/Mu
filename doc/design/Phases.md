# Phases

## Configuration

### Options
Verbosity, optimization, etc.

### Package File
Contains build and package information. This includes things such as
executables, libraries, and test-suites; along with their modules
to build, dependencies, etc.

## Parsing

## Dependency Analysis
Puts modules in the proper order as to ensure that everything is defined
before use, and checks for circular dependencies.

## Renaming
Adds info to names such as its locality (whether it was defined in the current
module or a different one) and a unique identifying number for disambiguation.

## Semantic Analysis

### Type Checking

## Code Generation

### First Intermediate Representation
Like GHC's "Core"

### Second Intermediate Representation (LLVM)

### Linking
