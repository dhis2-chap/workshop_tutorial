# Using Git

## Why?

Git solves critical problems in software development:

- **Track changes**: See what changed, when, and why
- **Undo mistakes**: Revert to any previous version of your code
- **Collaborate**: Multiple people can work on the same project without overwriting each other's work
- **Backup**: Your code history is stored safely, not just the latest version

Without version control, you end up with folders like `model_final_v2_FIXED_really_final.py`.

## What is Git?

Git is a **version control system** — software that tracks changes to your files over time.

Key concepts:

- **Repository (repo)**: A folder tracked by Git, containing your files and their history
- **Commit**: A saved snapshot of your changes, like a checkpoint you can return to
- **Branch**: A parallel version of your code (for experimenting without affecting the main code)
- **Remote**: A copy of your repo on a server (e.g., GitHub) for backup and sharing

## How to Use Git

### Installation

**macOS:**

The instructions for setting up git on macOS are based on Homebrew ("brew") being installed. Homebrew is a package manager for macOS that simplifies installing and managing software.

You can install Homebrew by running:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Now you can use the `brew` command to install Git:

```bash
brew install git
```

**Linux (Ubuntu/Debian) / Windows (WSL):**

```bash
sudo apt update
sudo apt install git
```

### Initial Setup

Configure your identity (used in commits):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Essential Commands

**Clone an existing repository:**

```bash
git clone <url>
```

**Check what's changed:**

```bash
git status
```

**Stage files for commit:**

```bash
git add <file>       # Stage one file
git add .            # Stage all changes
```

**Save a snapshot (commit):**

```bash
git commit -m "Describe your changes"
```

**View history:**

```bash
git log --oneline
```

**Push to remote:**

```bash
git push
```

**Pull from remote:**

```bash
git pull
```

### Typical Workflow

1. Make changes to your files
2. Check what changed: `git status`
3. Stage your changes: `git add .`
4. Commit with a message: `git commit -m "Add new feature"`
5. Push to remote: `git push`

## Exercise

Complete these tasks to verify Git is working:

### 1. Check Git is installed

```bash
git --version
```

**Verify**: You should see a version number like `git version 2.x.x`

### 2. Configure your identity

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

**Verify**: Run `git config --list` and confirm your name and email appear

### 3. Create a test repository

```bash
mkdir git_test
cd git_test
git init
```

**Verify**: You should see `Initialized empty Git repository`

### 4. Make your first commit

```bash
echo "Hello Git" > README.md
git status
```

**Verify**: You should see `README.md` listed as an untracked file

```bash
git add README.md
git commit -m "Initial commit"
```

**Verify**: You should see `1 file changed, 1 insertion(+)`

### 5. View your history

```bash
git log --oneline
```

**Verify**: You should see your commit with the message "Initial commit"

### 6. Clean up

```bash
cd ..
rm -rf git_test
```

If all verifications passed, you're ready for the next guide: [Using GitHub](github.md)
