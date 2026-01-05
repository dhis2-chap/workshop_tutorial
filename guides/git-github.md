# Git and GitHub

## Why?

When working with code, you need to:
- **Access code others have shared** — download projects, examples, and libraries
- **Share your own code** — let others use, review, or collaborate on your work
- **Keep your code safe** — store it somewhere that won't disappear if your laptop breaks

GitHub is a website for sharing code. Git is a tool for downloading and uploading code to GitHub.

## What is GitHub?

GitHub is a **website for hosting and sharing code**. Think of it as Google Drive for code, but with features designed specifically for programmers.

Key concepts:
- **Repository (repo)**: A project folder containing code and files, hosted on GitHub
- **Fork**: Your personal copy of someone else's repository — you can modify it without affecting the original

## Getting Started with GitHub

### Creating an Account

If you don't already have a GitHub account:

1. Go to [github.com](https://github.com)
2. Click "Sign up"
3. Follow the registration steps
4. Verify your email address

If you already have an account, just sign in.

### Browsing a Repository

Once logged in, you can explore any public repository:

1. Go to a repository URL (e.g., `github.com/knutdrand/chap-python-sdk`)
2. You'll see:
   - **File list**: All the files and folders in the project
   - **README**: A description of the project (displayed at the bottom)
   - **Code button**: For downloading or cloning the code

Click on any file to view its contents. Click on folders to navigate into them.

### Forking a Repository

Forking creates your own copy of a repository that you can modify:

1. Navigate to the repository you want to fork
2. Click the **"Fork"** button in the top right
3. Select your account as the destination
4. You now have your own copy at `github.com/YOUR-USERNAME/repo-name`

Your fork is completely independent — changes you make won't affect the original.

## What is Git?

Git is a **command-line tool** that works with GitHub. While GitHub is the website where code is stored, Git is the tool you use to:
- **Download** code from GitHub to your computer
- **Upload** your changes back to GitHub
- **Track changes** to your code over time (so you can see what changed and undo mistakes)

## Using Git

### Installation

**macOS:**
```bash
brew install git
```

**Linux (Ubuntu/Debian) / Windows (WSL):**
```bash
sudo apt update
sudo apt install git
```

### Initial Setup

Configure your identity (this labels your changes):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Cloning a Repository

"Cloning" means downloading a repository to your computer:

```bash
git clone https://github.com/YOUR-USERNAME/repo-name.git
cd repo-name
```

This creates a folder with all the files from the repository.

### Making Changes

After cloning, you can edit files normally with any text editor. When you're ready to save your changes, you'll use a two-step process: **staging** and **committing**.

**1. Check what's changed:**
```bash
git status
```
This shows which files you've modified, added, or deleted.

**2. Stage your changes:**
```bash
git add .
```
Staging selects which changes you want to include in your next save. The `.` means "all changes", but you can also stage specific files with `git add filename.py`. Think of it as putting items in a box before shipping.

**3. Commit your changes:**
```bash
git commit -m "Describe what you changed"
```
Committing saves a snapshot of your staged changes with a message describing what you did. This creates a checkpoint you can return to later. The message helps you (and others) understand what changed and why.

### Pushing to GitHub

After committing, your changes are saved locally on your computer. To share them on GitHub, you need to **push**:

```bash
git push
```

This uploads your commits to GitHub, making them visible to others and backing them up online.

### Pulling Updates

If the repository has changed on GitHub (e.g., you made changes on another computer, or a collaborator pushed updates), you need to **pull** those changes to your local copy:

```bash
git pull
```

This downloads any new commits from GitHub and updates your local files.

## Exercise

### Part 1: GitHub (Web Interface)

**1. Create a GitHub account**

Go to [github.com](https://github.com) and sign up (if you haven't already).

**Verify**: You can log in to github.com

**2. Browse a repository**

Go to https://github.com/knutdrand/chap-python-sdk

**Verify**: You can see the list of files and the README at the bottom

**3. Fork the repository**

1. Click "Fork" in the top right
2. Select your account

**Verify**: You now have a copy at `github.com/YOUR-USERNAME/chap-python-sdk`

### Part 2: Git (Command Line)

**4. Check Git is installed**
```bash
git --version
```
**Verify**: You should see a version number like `git version 2.x.x`

**5. Configure your identity**
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```
**Verify**: Run `git config --list` and confirm your name and email appear

**6. Clone your fork**
```bash
git clone https://github.com/YOUR-USERNAME/chap-python-sdk.git
cd chap-python-sdk
```
**Verify**: Run `ls` and you should see the repository files

**7. Check the remote**
```bash
git remote -v
```
**Verify**: You should see `origin` pointing to your GitHub fork

**8. Make a change**

Open the README.md file in a text editor and add a line (e.g., your name or a note). Save the file.

**9. Check the status**
```bash
git status
```
**Verify**: You should see `README.md` listed as modified (in red)

**10. Stage, commit, and push**
```bash
git add README.md
git status
```
**Verify**: `README.md` should now be listed as staged (in green)

```bash
git commit -m "Add my name to README"
git push
```
**Verify**: Visit your fork on GitHub and you should see your change in the README

If all verifications passed, you're ready for the next guide: [Pull Requests](pull-requests.md)

## Learn More

Want to dive deeper? Here are some helpful resources:

**GitHub:**
- [GitHub's "What is GitHub?" guide](https://docs.github.com/en/get-started/start-your-journey/about-github-and-git) — Official introduction to GitHub and how it works
- [GitHub Skills](https://skills.github.com/) — Free interactive courses to learn GitHub

**Git:**
- [Git Cheat Sheet (GitHub)](https://education.github.com/git-cheat-sheet-education.pdf) — Quick reference for common Git commands
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials) — In-depth explanations of Git concepts and commands
- [Pro Git Book](https://git-scm.com/book/en/v2) — Free comprehensive book on Git (if you want to understand everything)
