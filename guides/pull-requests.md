# Pull Requests

## Why?

Pull requests (PRs) enable:
- **Code review**: Others can review your changes before they're merged
- **Discussion**: Propose changes and get feedback
- **Quality control**: Maintainers can ensure changes meet project standards
- **Documentation**: PRs create a record of why changes were made

Without PRs, you'd need direct write access to modify projects, and changes would go unreviewed.

## What is a Pull Request?

A **pull request** is a proposal to merge changes from one branch (usually your fork) into another (usually the original repository's main branch).

The workflow:
1. You fork a repository and make changes
2. You create a PR proposing those changes
3. Maintainers review and discuss
4. If approved, your changes are merged

## How to Create Pull Requests

### Prerequisites

Before creating a pull request:
1. Fork and clone a repository ([see Git and GitHub guide](git-github.md))
2. Make and commit your changes
3. Push your changes to your fork

### Using the Web Interface

1. Go to your fork on GitHub
2. You'll see a banner saying "This branch is X commits ahead"
3. Click "Contribute" > "Open pull request"
4. Review the changes shown
5. Add a title and description explaining your changes
6. Click "Create pull request"

### Using GitHub CLI

```bash
# Create a pull request interactively
gh pr create

# Create with title and body
gh pr create --title "Add new feature" --body "Description of changes"

# Open in browser to fill details
gh pr create --web
```

### Managing Pull Requests

```bash
# List open pull requests
gh pr list

# View a specific PR
gh pr view 123

# Check out someone's PR to test locally
gh pr checkout 123
```

### Updating Your Pull Request

If you need to make changes after creating a PR:

```bash
# Make your changes locally
# ... edit files ...

# Commit and push
git add .
git commit -m "Address review feedback"
git push
```

The pull request automatically updates with your new commits.

## Exercise

Complete these tasks to practice the pull request workflow:

### 1. Make a change to your fork
If you completed the GitHub exercise, you should have a cloned fork. Make a small change:
```bash
cd chap-python-sdk  # or chap-r-sdk
echo "# My notes" >> README.md
git add README.md
git commit -m "Add notes section to README"
git push
```
**Verify**: Run `git log --oneline -1` and see your new commit

### 2. View your fork on GitHub
Go to `github.com/YOUR-USERNAME/chap-python-sdk`

**Verify**: You should see a banner saying "This branch is 1 commit ahead"

### 3. Create a pull request (optional)
If you want to practice the full flow:
1. Click "Contribute" > "Open pull request"
2. Add a title like "Test PR - please ignore"
3. Add a description
4. Click "Create pull request"

**Verify**: You should see your PR on the original repository's Pull Requests tab

> Note: You can close the PR without merging if this is just practice.

### 4. (Alternative) Practice with GitHub CLI
```bash
gh pr create --web
```
**Verify**: Your browser opens to the PR creation page

If you completed these steps, you understand the pull request workflow. Next guide: [Virtual Environments](virtual-environments.md)
