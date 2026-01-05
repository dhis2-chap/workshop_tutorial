# Using GitHub

## Why?

GitHub lets you:
- **Backup your code** in the cloud, so you never lose work
- **Share projects** with collaborators or the public
- **Contribute to others' projects** through forks and pull requests
- **Track issues and discussions** for project management

Git stores history locally; GitHub stores it online where others can access it.

## What is GitHub?

GitHub is a **platform for hosting Git repositories** online. It adds collaboration features on top of Git:

- **Remote repository**: Your repo stored on GitHub's servers
- **Fork**: Your own copy of someone else's repository
- **Pull request**: A proposal to merge your changes into another repository
- **GitHub CLI (`gh`)**: A command-line tool to interact with GitHub

## How to Use GitHub

### Creating an Account

1. Go to [github.com](https://github.com)
2. Click "Sign up"
3. Follow the registration steps
4. Verify your email address

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

### GitHub CLI (`gh`)

The GitHub CLI lets you interact with GitHub from the terminal.

**Installation:**

macOS:
```bash
brew install gh
```

Linux (Ubuntu/Debian) / Windows (WSL):
```bash
sudo apt install gh
```

**Authentication:**
```bash
gh auth login
```

**Common commands:**
```bash
gh repo clone owner/repo     # Clone a repository
gh repo fork owner/repo      # Fork a repository
gh repo view --web           # Open repo in browser
```

### SSH Setup (Optional)

SSH keys let you push/pull without entering passwords:

```bash
# Generate a new SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Start the SSH agent and add your key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy the public key
cat ~/.ssh/id_ed25519.pub
```

Then add the public key to GitHub: Settings > SSH and GPG keys > New SSH key

## Exercise

Complete these tasks to verify GitHub is set up:

### 1. Create a GitHub account
Go to [github.com](https://github.com) and sign up (if you haven't already).

**Verify**: You can log in to github.com

### 2. Fork a test repository
1. Go to https://github.com/knutdrand/chap-python-sdk (or the R version)
2. Click "Fork" in the top right
3. Select your account

**Verify**: You now have a copy at `github.com/YOUR-USERNAME/chap-python-sdk`

### 3. Clone your fork
```bash
git clone https://github.com/YOUR-USERNAME/chap-python-sdk.git
cd chap-python-sdk
```
**Verify**: Run `ls` and you should see the repository files

### 4. Check the remote
```bash
git remote -v
```
**Verify**: You should see `origin` pointing to your GitHub fork

### 5. (Optional) Install GitHub CLI
```bash
gh --version
```
If not installed, follow the installation steps above, then:
```bash
gh auth login
```
**Verify**: Run `gh auth status` and confirm you're logged in

If all verifications passed, you're ready for the next guide: [Pull Requests](pull-requests.md)
