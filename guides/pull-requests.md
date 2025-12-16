# Pull Requests

## Introduction

A pull request (PR) is a way to propose changes from your fork back to the original repository. It allows maintainers to review your changes before merging them.

## Prerequisites

Before creating a pull request, you should have:

1. Forked and cloned a repository
2. Made and committed your changes
3. Pushed your changes to your fork

See [Using GitHub](github.md) for these steps.

## Creating a Pull Request

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

# Create and open in browser
gh pr create --web
```

## Managing Pull Requests

### Viewing Pull Requests

```bash
# List open pull requests
gh pr list

# View a specific pull request
gh pr view 123

# View in browser
gh pr view 123 --web
```

### Checking Out a Pull Request

To test someone else's pull request locally:

```bash
gh pr checkout 123
```

### Updating Your Pull Request

If you need to make changes after creating a PR:

```bash
# Make your changes
# ... edit files ...

# Commit and push
git add .
git commit -m "Address review feedback"
git push
```

The pull request will automatically update with your new commits.

## Best Practices

- **Write clear titles:** Summarize what the PR does
- **Describe your changes:** Explain why you made the changes
- **Keep PRs focused:** One feature or fix per pull request
- **Respond to feedback:** Address reviewer comments promptly

## Next Steps

After your pull request is reviewed and approved, a maintainer will merge it into the original repository.
