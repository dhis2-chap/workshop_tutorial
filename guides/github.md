# Using GitHub

## Introduction

GitHub is a platform for hosting Git repositories online. It enables collaboration, code sharing, and project management. You can interact with GitHub through the web interface or the `gh` command-line tool.

## Creating a GitHub Account

1. Go to [github.com](https://github.com)
2. Click "Sign up"
3. Follow the registration steps
4. Verify your email address

## Web Interface

### Forking a Repository

Forking creates your own copy of someone else's repository:

1. Navigate to the repository you want to fork
2. Click the "Fork" button in the top right
3. Select your account as the destination
4. You now have your own copy at `github.com/your-username/repo-name`

### Cloning Your Fork

After forking, clone it to your computer:

```bash
git clone https://github.com/your-username/repo-name.git
cd repo-name
```

## GitHub CLI (`gh`)

The GitHub CLI lets you interact with GitHub from the terminal.

### Installation

#### macOS

```bash
brew install gh
```

#### Linux (Ubuntu/Debian)

```bash
sudo apt install gh
```

#### Windows (WSL)

```bash
sudo apt install gh
```

### Authentication

```bash
gh auth login
```

Follow the prompts to authenticate with your GitHub account.

### Common Commands

```bash
# Clone a repository
gh repo clone owner/repo

# Fork a repository
gh repo fork owner/repo

# Create a new repository
gh repo create my-new-repo

# View repository in browser
gh repo view --web
```

## Workflow: Fork, Clone, Change, Push

### Using Web Interface + Git

```bash
# 1. Fork the repo on github.com (click Fork button)

# 2. Clone your fork
git clone https://github.com/your-username/repo-name.git
cd repo-name

# 3. Make changes
# ... edit files ...

# 4. Commit and push
git add .
git commit -m "Describe your changes"
git push
```

### Using GitHub CLI

```bash
# 1. Fork and clone in one command
gh repo fork owner/repo --clone
cd repo

# 2. Make changes
# ... edit files ...

# 3. Commit and push
git add .
git commit -m "Describe your changes"
git push
```

## SSH vs HTTPS

GitHub supports two methods for authentication:

- **HTTPS:** Uses username/password or personal access token
- **SSH:** Uses SSH keys (more convenient for frequent use)

### Setting up SSH Keys

```bash
# Generate a new SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add your key to the agent
ssh-add ~/.ssh/id_ed25519

# Copy the public key
cat ~/.ssh/id_ed25519.pub
```

Then add the public key to GitHub:
1. Go to Settings > SSH and GPG keys
2. Click "New SSH key"
3. Paste your public key and save

## Next Steps

You're now ready to start working with CHAP repositories. Try forking and cloning one of the model repositories to get started.

For contributing changes back to the original repository, see [Pull Requests](pull-requests.md).
