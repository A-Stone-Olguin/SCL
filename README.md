# Side-Channels with LEAN4 (SCL)

## About this repository
This repository aims to utilize side-channel analysis with LEAN4's code. 
The main analysis avenue will be [Cryptolib4](https://github.com/A-Stone-Olguin/cryptolib4), a way of verifying the semantic security of the ElGamal Encryption System.
Additionally, this repository utilizes the [Mathlib4](https://github.com/leanprover-community/mathlib4) library.
The side-channel analysis will be performed using the [ChipWhisperer](https://github.com/newaetech/chipwhisperer) system. 

This repository will use the open-source nature of ChipWhisperer to make a minimal build to analyze the LEAN4 code that compiles down to C code.

## Getting started
First, to ensure the Lean code works, install LEAN4 here: https://leanprover.github.io/lean4/doc/quickstart.html

After installing lean, install chipwhisperer here: 

 * [Windows](https://chipwhisperer.readthedocs.io/en/latest/windows-install.html)

 * [Linux](https://chipwhisperer.readthedocs.io/en/latest/linux-install.html)

### Building dependencies
To build the dependencies of Lean, run the following commands

- run `lake update` in the terminal
  - There might be some warnings about package configuration errors. This will be fixed in the next step.

  - In the terminal, run `cp lake-packages/mathlib/lean-toolchain .` to make sure current Lean version matches mathlib4's.

- Run `lake update` again, there should not be any errors now.

- (Optionally) run `lake exe cache get` in the terminal to save time compiling mathlib and its dependencies. This will download the dependencies' files. This is recommended if errors happen when downloading files.

- Run `lake build` in the terminal

- Restart your instance of your IDE (VSCode, Emacs...)