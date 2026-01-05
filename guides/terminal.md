# Working on the Terminal

## Why?

The terminal is essential for:
- Running Git commands to track and share your code
- Installing and managing packages (Python, R, etc.)
- Running scripts and development tools
- Accessing remote servers and using **CHAP**

GUIs can do some of these things, but the terminal gives you full control and works the same across tutorials, documentation, and different computers.

## What is the Terminal?

The terminal (also called command line, shell, or CLI) is a text-based interface for interacting with your computer. Instead of clicking icons, you type commands.

- **Shell**: The program that interprets your commands (e.g., bash, zsh)
- **Terminal**: The window where you type commands
- **Command**: A text instruction like `ls` (list files) or `cd` (change directory)

## How to Use the Terminal

### Open Terminal

<details>
  <summary><strong style="font-size: 24px">Windows</strong></summary>

To use CHAP CLI on a Windows machine, you need to install the Windows Subsystem for Linux (WSL).

Windows Subsystem for Linux (WSL) allows you to run a Linux environment on your Windows machine without the need for a separate virtual machine or dual booting. Read more about WSL [here](https://learn.microsoft.com/en-us/windows/wsl/about).

1. Start **PowerShell** by searching for it in the Start Menu in Windows
   <img src="image.png" alt="PowerShell Start Menu" width="400" />

2. Within the shell, execute:

   ```bash
   wsl --install
   ```

3. Restart your computer

4. Search for and open "Ubuntu" from the Start menu. You now have access to Ubuntu command line, which is a Linux distribution, allowing you to execute Linux commands.

</details>

<details>
  <summary><strong style="font-size: 24px">Mac / Linux</strong></summary>

Open the <strong>Terminal</strong> application.

On macOS, you can find it in
<strong>Applications → Utilities → Terminal</strong>,
or search for "Terminal" using Spotlight (CMD + Space).

</details>

### Basic Commands

| Command           | Description                                  |
| ----------------- | -------------------------------------------- |
| `pwd`             | Print working directory (show where you are) |
| `ls`              | List files and folders                       |
| `cd <folder>`     | Change directory                             |
| `cd ..`           | Go up one directory                          |
| `mkdir <name>`    | Create a new folder                          |
| `touch <file>`    | Create a new empty file                      |
| `cat <file>`      | Display file contents                        |
| `cp <src> <dest>` | Copy a file                                  |
| `mv <src> <dest>` | Move or rename a file                        |
| `rm <file>`       | Delete a file                                |

### Navigation Tips

- Use `Tab` to autocomplete file and folder names
- Use the up/down arrow keys to scroll through previous commands
- Use `Ctrl+C` to cancel a running command
- Use `clear` to clear the terminal screen

## Exercise

Complete these tasks to verify your terminal is working:

### 1. Open your terminal
- **macOS/Linux**: Open Terminal
- **Windows**: Open Ubuntu (WSL)

### 2. Check your location
```bash
pwd
```
**Verify**: You should see a path like `/home/username` or `/Users/username`

### 3. List files
```bash
ls
```
**Verify**: You should see files and folders in your home directory

### 4. Create a test folder
```bash
mkdir terminal_test
cd terminal_test
pwd
```
**Verify**: The path should now end with `terminal_test`

### 5. Create and view a file
```bash
touch hello.txt
ls
```
**Verify**: You should see `hello.txt` listed

### 6. Clean up
```bash
cd ..
rm -r terminal_test
ls
```
**Verify**: The `terminal_test` folder should be gone

If all verifications passed, you're ready for the next guide: [Git and GitHub](git-github.md)
