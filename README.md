# EDA333 -- Laboratory Materials

This repository contains the required materials for the **EDA333**
laboratory sessions.\
It includes the Ripes RISC-V simulator, pre-built RISC-V toolchains, and
all lab assignments.

------------------------------------------------------------------------

## Repository Overview

This Git repository is organized to provide:

-   Laboratory assignments
-   Required simulator setup
-   A compatible pre-built RISC-V GCC toolchain
-   Documentation for setup and usage

The `main` branch contains the latest stable version of all materials.

------------------------------------------------------------------------

## Repository Structure

    .
    ├── Ripes/
    ├── lab1/
    ├── lab2/
    ├── lab3/
    ├── riscv64-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32/
    └── README.md

### Ripes/

Contains the **Ripes RISC-V simulator** used during the course.

-   Includes configuration required for laboratory work.
-   The correct pre-built compiler for Ripes is included in this
    repository.

------------------------------------------------------------------------

### lab1/

Contains all source files and materials for **Lab 1**.

------------------------------------------------------------------------

### lab2/

Contains all source files and materials for **Lab 2** (reworked
version).

------------------------------------------------------------------------

### lab3/

Contains all source files and materials for **Lab 3**.

------------------------------------------------------------------------

### riscv64-gcc-8.3.0-2020.04.1-x86_64-w64-mingw32/

Pre-built **RISC-V GCC toolchain** for Windows (64-bit).

-   **Version:** 8.3.0\
-   **Target architecture:** riscv64\
-   **Host system:** x86_64-w64-mingw32\
-   Intended for compatibility with Ripes.

------------------------------------------------------------------------

## Requirements

-   Windows (required for the included toolchain)
-   Ripes simulator

------------------------------------------------------------------------

## Cloning the Repository

``` bash
git clone <repository-url>
cd <repository-folder>
```

------------------------------------------------------------------------

## Updating the Repository

``` bash
git pull origin main
```

------------------------------------------------------------------------

## Notes

-   The included toolchain is pre-configured for compatibility with
    Ripes.
-   Always use the provided compiler version to avoid compatibility
    issues.
-   Do not modify the toolchain directory unless explicitly instructed.

------------------------------------------------------------------------

## Course Information

Course: EDA333\
Content: RISC-V programming and architecture laboratories
