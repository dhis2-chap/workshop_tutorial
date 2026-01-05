# Virtual Environments and Containerization

This guide explains how to create **reproducible, isolated environments** for your code. We'll start with *why* this matters, then cover practical tools for Python (`uv`), R (`renv`), and full containerization (`Docker`).

---

## The Problem: "It Works on My Machine"

Imagine this scenario: You write a Python script that analyzes climate data. It works perfectly on your laptop. You share it with a colleague, and they get errors. What went wrong?

The culprit is usually **dependencies** — the packages and libraries your code relies on. Your script might need:

- A specific version of Python (e.g., 3.11, not 3.9)
- The `pandas` library at version 2.0 (not 1.5)
- A library that requires a C compiler to install

Your colleague's computer might have different versions, or be missing packages entirely. This is the **reproducibility problem**, and it's one of the biggest obstacles in collaborative coding.

---

## The Solution: Isolation

The core idea is **isolation** — giving each project its own separate space with exactly the packages it needs. Think of it like this:

| Approach | Real-world Analogy |
|----------|-------------------|
| No isolation (global install) | One shared kitchen where everyone's ingredients get mixed together |
| Virtual environment | Separate ingredient boxes for each recipe |
| Container (Docker) | Separate fully-equipped kitchens, each with their own stove and utensils |

**Virtual environments** (like `uv` for Python or `renv` for R) give you isolated *packages*. Your project gets its own folder of dependencies, separate from other projects.

**Containers** (like Docker) go further — they isolate the *entire operating system*. A container includes the operating system, the programming language, all packages, and your code. If it runs in a container on your machine, it will run identically on any other machine.

---

## When to Use What?

| Scenario | Recommended Tool |
|----------|------------------|
| Python project, working locally | `uv` |
| R project, working locally | `renv` |
| Sharing code that must work exactly the same everywhere | Docker |
| Running code on a server or in production | Docker |
| Working with teammates on different operating systems | Docker |

For most day-to-day work, virtual environments (`uv` or `renv`) are sufficient. Docker is useful when you need **guaranteed** reproducibility across different machines.

---

## Why Dependency Problems Happen

Before diving into the tools, let's understand *why* these problems occur:

### 1. Dependency Conflicts

Project A needs `pandas 1.5`, but Project B needs `pandas 2.0`. If you install packages globally (system-wide), you can only have one version. Installing `pandas 2.0` breaks Project A.

```
Your computer (without virtual environments):
├── Python 3.11
├── pandas 2.0      ← Project B needs this
└── numpy 1.24

Project A: "I need pandas 1.5!" → ERROR
```

### 2. System Pollution

Some operating system tools depend on specific Python packages. If you upgrade a package globally, you might break system utilities.

### 3. "It Works on My Machine"

You install packages over months of working on a project. You don't remember exactly which ones. When a colleague tries to run your code, they're missing half the dependencies.

### 4. Version Drift

You share code with a colleague. A month later, they run `pip install pandas` and get a newer version than you had. Your code breaks because of a breaking change in the new version.

---

## The Solution: Lockfiles

Both `uv` and `renv` use **lockfiles** — files that record the *exact* versions of every package installed. When a colleague runs your code, they install from the lockfile, getting identical versions.

```
Your machine:                  Colleague's machine:
├── pandas 2.0.3              ├── pandas 2.0.3      ← Identical!
├── numpy 1.24.2              ├── numpy 1.24.2      ← Identical!
└── scikit-learn 1.3.0        └── scikit-learn 1.3.0 ← Identical!
        ↑                              ↑
    uv.lock or renv.lock specifies these exact versions
```

---

## Python: uv

`uv` is a modern Python package manager. It does three things:

1. **Creates virtual environments** — isolated folders for your project's packages
2. **Installs packages** — downloads and installs libraries like `pandas` or `numpy`
3. **Manages Python versions** — lets you use different Python versions for different projects

### What Does uv Create?

When you use `uv` in a project, it creates:

```
my_project/
├── pyproject.toml    ← Lists your dependencies (human-readable)
├── uv.lock           ← Exact versions of all packages (for reproducibility)
└── .venv/            ← The virtual environment folder (packages live here)
```

- **`pyproject.toml`**: A configuration file listing what packages you need (e.g., "I need pandas")
- **`uv.lock`**: A lockfile with *exact* versions (e.g., "pandas 2.0.3, numpy 1.24.2, ...")
- **`.venv/`**: A folder containing the actual installed packages. This folder is *not* committed to Git — each person regenerates it from the lockfile.

### Installation

#### macOS / Linux / WSL

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

After installation, restart your terminal or run:

```bash
source $HOME/.local/bin/env
```

#### Windows (PowerShell)

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

### Creating a New Project

```bash
# Create a new project folder with uv set up
uv init my_project
cd my_project
```

This creates the `pyproject.toml` and `.venv/` folder. You're ready to start adding packages.

### Working with an Existing Project

This is the most common scenario — you've cloned someone else's project and want to run it:

```bash
# Clone the project
git clone https://github.com/user/project.git
cd project

# Install all dependencies (creates .venv/ and installs packages from uv.lock)
uv sync
```

The `uv sync` command reads the lockfile and installs the exact same packages that the original author had. This is where reproducibility comes from.

### Adding Packages

```bash
# Add a package to your project
uv add pandas

# This does three things:
# 1. Downloads pandas and its dependencies
# 2. Installs them in .venv/
# 3. Updates pyproject.toml and uv.lock
```

To add a package you only need during development (like a testing framework):

```bash
uv add --dev pytest
```

### Running Your Code

Here's the key concept: **always use `uv run`** to run your Python code. This ensures you're using the project's virtual environment, not your system Python.

```bash
# Run a Python script
uv run python script.py

# Run a command from an installed package
uv run pytest

# Start a Python interpreter
uv run python
```

**Why `uv run`?** Without it, you might accidentally use packages from a different project or your global Python installation.

### Managing Python Versions

Different projects may need different Python versions. `uv` handles this:

```bash
# Install Python 3.12
uv python install 3.12

# Pin your project to use Python 3.12
uv python pin 3.12

# See available Python versions
uv python list
```

### Typical Workflow Example

Here's a complete example of cloning a project and running it:

```bash
# 1. Clone a project
git clone https://github.com/user/chap-model.git
cd chap-model

# 2. Install dependencies from the lockfile
uv sync

# 3. Run the code
uv run python main.py

# 4. If you need to add a new package
uv add numpy

# 5. Commit the updated dependencies (so teammates get them too)
git add pyproject.toml uv.lock
git commit -m "Add numpy dependency"
```

### Quick Reference

| What you want to do | Command |
|---------------------|---------|
| Install dependencies | `uv sync` |
| Add a package | `uv add <package>` |
| Remove a package | `uv remove <package>` |
| Run a script | `uv run python script.py` |
| Update all packages | `uv sync --upgrade` |

---

## R: renv

`renv` is a package manager for R that creates isolated, reproducible environments. It works similarly to `uv` for Python — each project gets its own set of packages.

### What Does renv Create?

When you use `renv` in a project, it creates:

```
my_project/
├── renv.lock      ← Exact versions of all packages (for reproducibility)
├── renv/          ← The local library folder (packages live here)
└── .Rprofile      ← Auto-activates renv when you open R in this folder
```

- **`renv.lock`**: A lockfile listing every package with its exact version
- **`renv/`**: A folder containing the installed packages. Like `.venv/` in Python, this is *not* committed to Git.
- **`.Rprofile`**: A startup script that activates `renv` automatically when you open R in this folder

### Installation

In R or RStudio, run:

```r
install.packages("renv")
```

You only need to do this once. After that, `renv` is available in all your R sessions.

### Creating a New Project

```r
# Navigate to your project folder, then:
renv::init()
```

This sets up the `renv.lock`, `renv/` folder, and `.Rprofile`. Your project is now isolated from other R projects.

### Working with an Existing Project

This is the most common scenario — you've cloned someone else's project that uses `renv`:

```bash
# Clone the project
git clone https://github.com/user/project.git
cd project
```

```r
# Open R (or RStudio) in the project folder
# renv activates automatically, then run:
renv::restore()
```

The `renv::restore()` command reads the lockfile and installs the exact same packages the original author had.

### Adding Packages

With `renv`, you install packages the normal way, then **snapshot** to save them:

```r
# Step 1: Install a package as usual
install.packages("dplyr")

# Step 2: Save the new package to the lockfile
renv::snapshot()
```

The `snapshot()` step is important — it updates `renv.lock` so your teammates can install the same packages.

### Checking Your Environment

```r
# See if your lockfile matches your installed packages
renv::status()
```

If you've installed packages but haven't run `snapshot()`, this will tell you.

### Typical Workflow Example

```r
# 1. Clone a project and open in R/RStudio
# (renv activates automatically via .Rprofile)

# 2. Install all packages from the lockfile
renv::restore()

# 3. Work on your code...

# 4. If you installed new packages, save them
renv::snapshot()
```

Then in the terminal:

```bash
# 5. Commit the updated lockfile so teammates get the new packages
git add renv.lock
git commit -m "Add dplyr dependency"
```

### Using renv with RStudio

RStudio makes `renv` even easier:

1. Open the project folder in RStudio (File → Open Project)
2. RStudio detects `renv` and prompts you to restore packages
3. Click "Restore" — done!

### Quick Reference

| What you want to do | Command |
|---------------------|---------|
| Set up renv | `renv::init()` |
| Install packages from lockfile | `renv::restore()` |
| Save installed packages to lockfile | `renv::snapshot()` |
| Check if lockfile is in sync | `renv::status()` |
| Update all packages | `renv::update()` |

---

## Docker: Full Containerization

Virtual environments isolate your *packages*, but what about the operating system itself? What if your code depends on system libraries, specific versions of R or Python, or tools that are difficult to install?

**Docker** solves this by packaging your *entire environment* — operating system, programming language, packages, and code — into a **container**.

### What is a Container?

Think of a container as a lightweight, portable virtual computer:

```
┌─────────────────────────────────────────────┐
│ Container                                   │
│ ┌─────────────────────────────────────────┐ │
│ │ Your code                               │ │
│ ├─────────────────────────────────────────┤ │
│ │ Packages (pandas, numpy, etc.)          │ │
│ ├─────────────────────────────────────────┤ │
│ │ Python 3.11                             │ │
│ ├─────────────────────────────────────────┤ │
│ │ Operating system (Linux)                │ │
│ └─────────────────────────────────────────┘ │
└─────────────────────────────────────────────┘
```

Unlike a full virtual machine, containers are lightweight and start in seconds. They share the host computer's kernel, so they use minimal resources.

### When to Use Docker

Docker is most useful when:

- **Guaranteed reproducibility**: The container runs identically on any machine
- **Complex dependencies**: Your code needs system libraries or tools that are hard to install
- **Deployment**: You want to run your code on a server or in the cloud
- **Cross-platform collaboration**: Your team uses different operating systems

For simple local development, `uv` or `renv` are usually sufficient. Docker adds complexity but provides stronger guarantees.

### Key Concepts

| Term | What it means |
|------|--------------|
| **Image** | A blueprint/recipe for a container (like a template) |
| **Container** | A running instance of an image (like a process) |
| **Dockerfile** | A text file with instructions to build an image |
| **Docker Hub** | A registry where people share images (like GitHub for containers) |

### Installation

#### macOS

1. Download [Docker Desktop for Mac](https://www.docker.com/products/docker-desktop/)
2. Open the downloaded file and drag Docker to Applications
3. Open Docker from Applications

#### Windows

1. Download [Docker Desktop for Windows](https://www.docker.com/products/docker-desktop/)
2. Run the installer
3. Restart your computer if prompted
4. Open Docker Desktop

#### Linux

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Add yourself to the docker group (so you don't need sudo)
sudo usermod -aG docker $USER
# Log out and log back in for this to take effect
```

### Running a Container

The most basic command is `docker run`:

```bash
# Run a Python container
docker run python:3.11 python --version
```

This downloads the Python 3.11 image (if you don't have it), starts a container, runs `python --version`, and exits.

### Running an Interactive Container

To get a shell inside a container:

```bash
# Start an interactive Python container
docker run -it python:3.11 bash

# Now you're inside the container!
# Try running Python
python --version
pip install pandas

# Exit the container
exit
```

The `-it` flags mean "interactive" and "allocate a terminal".

### Working with Files

By default, containers are isolated from your files. To share a folder with the container, use a **volume mount**:

```bash
# Mount the current directory into the container
docker run -it -v $(pwd):/app python:3.11 bash

# Inside the container, your files are in /app
cd /app
ls
python your_script.py
```

The `-v $(pwd):/app` means "mount my current directory to `/app` inside the container".

### Using a Dockerfile

For reproducible environments, create a **Dockerfile** — a recipe for building your container:

```dockerfile
# Dockerfile
FROM python:3.11

# Set the working directory
WORKDIR /app

# Copy your project files
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Default command to run
CMD ["python", "main.py"]
```

Then build and run:

```bash
# Build an image from the Dockerfile
docker build -t my-project .

# Run a container from your image
docker run my-project
```

### A Complete Example

Let's say you have a Python project that you want to containerize:

```
my-project/
├── main.py
├── requirements.txt
└── Dockerfile
```

**main.py:**
```python
import pandas as pd
print("Hello from Docker!")
print(f"Pandas version: {pd.__version__}")
```

**requirements.txt:**
```
pandas==2.0.3
```

**Dockerfile:**
```dockerfile
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
CMD ["python", "main.py"]
```

**Build and run:**
```bash
# Build the image
docker build -t my-project .

# Run it
docker run my-project
# Output:
# Hello from Docker!
# Pandas version: 2.0.3
```

Now anyone with Docker can run `docker run my-project` and get the exact same output, regardless of their operating system or Python installation.

### Quick Reference

| What you want to do | Command |
|---------------------|---------|
| Run a container | `docker run <image>` |
| Run interactively | `docker run -it <image> bash` |
| Mount files | `docker run -v $(pwd):/app <image>` |
| Build from Dockerfile | `docker build -t <name> .` |
| List running containers | `docker ps` |
| Stop a container | `docker stop <container_id>` |
| List images | `docker images` |

### Docker vs Virtual Environments

| Feature | Virtual Environment (uv/renv) | Docker |
|---------|-------------------------------|--------|
| Isolates packages | Yes | Yes |
| Isolates Python/R version | Partially | Yes |
| Isolates operating system | No | Yes |
| Works across OS (Mac/Win/Linux) | Varies | Yes |
| Setup complexity | Low | Medium |
| Performance overhead | None | Minimal |
| Best for | Local development | Deployment, sharing |

---

## Summary

| Feature | Python (uv) | R (renv) | Docker |
|---------|-------------|----------|--------|
| Initialize | `uv init` | `renv::init()` | Create Dockerfile |
| Install deps | `uv sync` | `renv::restore()` | `docker build` |
| Add package | `uv add pkg` | `install.packages(); renv::snapshot()` | Update Dockerfile |
| Run code | `uv run python script.py` | `Rscript script.R` | `docker run <image>` |
| Lockfile | `uv.lock` | `renv.lock` | Dockerfile |
| Isolates | Packages | Packages | Everything |

## Choosing the Right Tool

```
Do you need guaranteed reproducibility across different operating systems?
├── Yes → Use Docker
└── No → Is your project in Python or R?
         ├── Python → Use uv
         └── R → Use renv
```

For most development work, start with `uv` or `renv`. Add Docker when you need to share your environment with others or deploy to a server.

## Exercise

Complete the exercise for your language of choice:

### Python (uv)

#### 1. Install uv
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
```
**Verify**: Run `uv --version` and see a version number

#### 2. Clone a project with dependencies
```bash
git clone https://github.com/knutdrand/chap-python-sdk.git
cd chap-python-sdk
```

#### 3. Install dependencies
```bash
uv sync
```
**Verify**: You should see packages being installed

#### 4. Run code using the environment
```bash
uv run python --version
```
**Verify**: You see a Python version number

---

### R (renv)

#### 1. Install renv
In R or RStudio:
```r
install.packages("renv")
```
**Verify**: No errors appear

#### 2. Clone a project with renv
```bash
git clone https://github.com/knutdrand/chap-r-sdk.git
cd chap-r-sdk
```

#### 3. Restore dependencies
Open R in the project folder:
```r
renv::restore()
```
**Verify**: Packages are installed from the lockfile

#### 4. Check status
```r
renv::status()
```
**Verify**: Shows that the lockfile is in sync

---

If your verification steps passed, your environment is ready for running CHAP models.
