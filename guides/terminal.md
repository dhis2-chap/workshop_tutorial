# Working on the Terminal

## Introduction

The terminal (also called command line or shell) is a text-based interface for interacting with your computer. Learning basic terminal skills is essential for working with Git, running scripts, and using development tools.

## Getting Started

### macOS / Linux

Open the Terminal application. On macOS, you can find it in Applications > Utilities > Terminal, or search for "Terminal" using Spotlight.

### Windows

We recommend using Windows Subsystem for Linux (WSL):

1. Open PowerShell as Administrator
2. Run: `wsl --install`
3. Restart your computer
4. Open "Ubuntu" from the Start menu

## Basic Commands

| Command | Description |
|---------|-------------|
| `pwd` | Print working directory (show where you are) |
| `ls` | List files and folders |
| `cd <folder>` | Change directory |
| `cd ..` | Go up one directory |
| `mkdir <name>` | Create a new folder |
| `touch <file>` | Create a new empty file |
| `cat <file>` | Display file contents |
| `cp <src> <dest>` | Copy a file |
| `mv <src> <dest>` | Move or rename a file |
| `rm <file>` | Delete a file |

## Navigation Tips

- Use `Tab` to autocomplete file and folder names
- Use the up/down arrow keys to scroll through previous commands
- Use `Ctrl+C` to cancel a running command
- Use `clear` to clear the terminal screen

## Example Session

```bash
# See where you are
pwd

# List files in current directory
ls

# Create a new folder and navigate into it
mkdir my_project
cd my_project

# Create a file
touch README.md

# Go back up one directory
cd ..
```

## Next Steps

Once you're comfortable with basic terminal commands, move on to [Using Git](git.md).
