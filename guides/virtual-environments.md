# Virtual Environments

## Why Virtual Environments?

When working on multiple projects, you'll often need different versions of packages or even different versions of Python/R itself. Without virtual environments, you run into problems:

- **Dependency conflicts:** Project A needs `pandas 1.5` but Project B needs `pandas 2.0`
- **Reproducibility:** Your code works on your machine but fails on a colleague's
- **System pollution:** Installing packages globally can break system tools
- **Collaboration:** Hard to share exact dependencies with teammates

Virtual environments solve this by creating isolated spaces for each project, with their own packages and dependencies.

## Python: uv

`uv` is a fast, modern Python package manager that handles virtual environments, package installation, and Python version management.

### Installation

#### macOS / Linux

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

#### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### Basic Usage

#### Creating a Project

```bash
# Initialize a new project
uv init my_project
cd my_project

# This creates:
# - pyproject.toml (project configuration)
# - .venv/ (virtual environment)
```

#### Working with an Existing Project

```bash
# Clone a project
git clone https://github.com/user/project.git
cd project

# Create environment and install dependencies
uv sync
```

#### Managing Packages

```bash
# Add a package
uv add pandas

# Add a development dependency
uv add --dev pytest

# Remove a package
uv remove pandas

# Update all packages
uv sync --upgrade
```

#### Running Scripts

```bash
# Run a Python script (uses the project's environment)
uv run python script.py

# Run a command from an installed package
uv run pytest
```

#### Python Version Management

```bash
# Install a specific Python version
uv python install 3.12

# Use a specific version for your project
uv python pin 3.12

# List available Python versions
uv python list
```

### Typical Workflow

```bash
# 1. Clone a project
git clone https://github.com/user/chap-model.git
cd chap-model

# 2. Install dependencies
uv sync

# 3. Run the code
uv run python main.py

# 4. Add a new package if needed
uv add numpy

# 5. Commit the updated dependencies
git add pyproject.toml uv.lock
git commit -m "Add numpy dependency"
```

---

## R: renv

`renv` is a dependency management tool for R that creates isolated, reproducible environments for your projects.

### Installation

In R, run:

```r
install.packages("renv")
```

### Basic Usage

#### Creating a New Project

```r
# Initialize renv in your project
renv::init()

# This creates:
# - renv.lock (lockfile with exact versions)
# - renv/ folder (local library)
# - .Rprofile (auto-activates renv)
```

#### Working with an Existing Project

```bash
# Clone a project
git clone https://github.com/user/project.git
cd project
```

```r
# Open R and restore dependencies
renv::restore()
```

#### Managing Packages

```r
# Install a package (as usual)
install.packages("dplyr")

# Install from GitHub
renv::install("tidyverse/dplyr")

# Update the lockfile after installing packages
renv::snapshot()

# Update all packages
renv::update()
```

### Key Commands

| Command | Description |
|---------|-------------|
| `renv::init()` | Initialize renv in a project |
| `renv::restore()` | Install packages from lockfile |
| `renv::snapshot()` | Save current packages to lockfile |
| `renv::update()` | Update packages |
| `renv::status()` | Check if lockfile is in sync |

### Typical Workflow

```r
# 1. Clone a project and open in R/RStudio
# renv activates automatically via .Rprofile

# 2. Restore dependencies
renv::restore()

# 3. Work on your code...

# 4. If you added new packages, update the lockfile
renv::snapshot()

# 5. Commit the lockfile
# (in terminal)
# git add renv.lock
# git commit -m "Update dependencies"
```

### Using renv with RStudio

RStudio detects renv projects automatically:

1. Open the project folder in RStudio
2. RStudio will prompt you to restore packages
3. Click "Restore" to install dependencies

---

## Summary

| Feature | Python (uv) | R (renv) |
|---------|-------------|----------|
| Initialize | `uv init` | `renv::init()` |
| Install deps | `uv sync` | `renv::restore()` |
| Add package | `uv add pkg` | `install.packages(); renv::snapshot()` |
| Run code | `uv run python script.py` | `Rscript script.R` |
| Lockfile | `uv.lock` | `renv.lock` |

## Next Steps

With your virtual environment set up, you're ready to run CHAP models. See the model-specific documentation for next steps.
