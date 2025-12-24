# Homework: January 7th

Complete this homework **before** the January 7th webinar to practice using the terminal, Git, and GitHub.

## Minimal Homework

Complete these steps to get the basics down:

### 1. Set Up Your Terminal

- **Windows:** Install WSL ([guide](../guides/terminal.md))
- **macOS/Linux:** Open your terminal application

### 2. Create a GitHub Account

1. Go to [github.com](https://github.com)
2. Click "Sign up" and follow the steps
3. Verify your email address

### 3. Fork a Model Repository

Choose either Python or R:

- **Python:** https://github.com/knutdrand/chap-python-sdk
- **R:** https://github.com/knutdrand/chap-r-sdk

To fork:
1. Go to the repository
2. Click the "Fork" button in the top right
3. Select your account

### 4. Clone Your Fork

```bash
# Replace YOUR-USERNAME with your GitHub username
git clone https://github.com/YOUR-USERNAME/chap-python-sdk.git
# or for R:
git clone https://github.com/YOUR-USERNAME/chap-r-sdk.git

cd chap-python-sdk  # or chap-r-sdk
```

### 5. Make a Small Change

Open the README file and add your name or a small note:

```bash
# Open in a text editor, e.g.:
nano README.md
# or
code README.md  # if you have VS Code
```

### 6. Commit and Push

```bash
git add README.md
git commit -m "Add my name to README"
git push
```

### 7. Verify Your Work

Go to your fork on GitHub and confirm your change is visible.

---

## Recommended (Extra Practice)

If you finish the minimal homework and want more practice:

### Explore Git Commands

```bash
# See the commit history
git log --oneline

# Check the status of your repository
git status

# See what changes you've made
git diff
```

### Make More Changes

1. Create a new file:
   ```bash
   touch notes.txt
   echo "My first note" > notes.txt
   ```

2. Add and commit it:
   ```bash
   git add notes.txt
   git commit -m "Add notes file"
   git push
   ```

### Install the GitHub CLI

Follow the [GitHub guide](../guides/github.md) to install `gh` and try:

```bash
gh auth login
gh repo view --web
```

---

## Questions?

Post your questions on the Community of Practice (CoP). Helping each other is part of the learning process!
