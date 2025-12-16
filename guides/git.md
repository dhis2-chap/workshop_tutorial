# Using Git

## Introduction

Git is a version control system that tracks changes to your files. It allows you to save snapshots of your work, collaborate with others, and revert to previous versions if needed.

## Installation

### macOS

```bash
# Using Homebrew
brew install git

# Or download from https://git-scm.com/download/mac
```

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install git
```

### Windows (WSL)

```bash
sudo apt update
sudo apt install git
```

## Initial Setup

Configure your identity (used for commits):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Basic Concepts

- **Repository (repo):** A folder tracked by Git
- **Commit:** A saved snapshot of your changes
- **Branch:** A parallel version of your code
- **Remote:** A copy of your repo on a server (e.g., GitHub)

## Essential Commands

### Creating and Cloning Repositories

```bash
# Initialize a new repository
git init

# Clone an existing repository
git clone <url>
```

### Making Changes

```bash
# Check status of your files
git status

# Stage files for commit
git add <file>
git add .  # Stage all changes

# Commit staged changes
git commit -m "Describe your changes"
```

### Viewing History

```bash
# View commit history
git log

# View compact history
git log --oneline
```

### Working with Remotes

```bash
# View remotes
git remote -v

# Push changes to remote
git push

# Pull changes from remote
git pull
```

## Typical Workflow

1. Make changes to your files
2. Check what changed: `git status`
3. Stage your changes: `git add .`
4. Commit with a message: `git commit -m "Add new feature"`
5. Push to remote: `git push`

## Example Session

```bash
# Clone a repository
git clone https://github.com/username/repo.git
cd repo

# Make a change
echo "Hello" >> README.md

# Stage and commit
git add README.md
git commit -m "Update README"

# Push to GitHub
git push
```

## Next Steps

Learn how to work with GitHub in [Using GitHub](github.md).
