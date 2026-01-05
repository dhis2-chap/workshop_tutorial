# Working on the Terminal

## Why terminal?

The terminal is essential for:

- Running Git commands to track and share your code
- Installing and managing packages (Python, R, etc.)
- Running scripts and development tools
- Using **Chap**

## What is the Terminal?

The terminal (also called the command line, shell, or CLI) is a text-based interface for interacting with your computer. Instead of clicking icons, you type commands, such as `ls`, which list items in your current directory.

- **Shell**: The program that interprets your commands (e.g., bash, zsh, PowerShell)
- **Terminal**: The window where you type commands
- **Command**: A text instruction like `ls` (list files) or `cd` (change directory)

## How to open/use the Terminal

<details>
  <summary><strong style="font-size: 24px">Windows</strong></summary>

To use Chap CLI on a Windows machine, you need to install the Windows Subsystem for Linux (WSL) and install Chap there. WSL allows you to run a Linux environment on your Windows machine without the need for a separate virtual machine or dual booting. Read more about WSL [here](https://learn.microsoft.com/en-us/windows/wsl/about).

The reason Windows users need to use WSL is that Chap has dependencies on software that is hard to install correctly on a Windows machine; therefore, we use WSL to make the installation process simpler and more reliable.

**How to install WSL**

1. Start **PowerShell** by searching for it in the Start Menu in Windows <br/> <img src="image.png" alt="PowerShell Start Menu" width="500">

2. Within the shell, execute the following command, and create username and password as promted.

   ```ps
   wsl --install
   ```

3. After the installation is finished, restart your computer

4. Reopen PowerShell and you can start WSL by executing `wsl` in PowerShell. This will start WSL and bring you to a linux command line interface, where you could execute Linux commands.

5. **Verify:** To verify everything works, you can try to execute `uname` in WSL. This should print "Linux", as shown below. <br/> <img src="image-3.png" alt="PowerShell Start Menu" width="600">! <br/>

#### ‼️When continuing this tutorial, ensure you always execute commands within WSL, and **not** by using PowerShell.

</details>

<details>
  <summary><strong style="font-size: 24px">Mac</strong></summary>

Open the <strong>Terminal</strong> application.

On macOS, you can find it in
<strong>Applications → Utilities → Terminal</strong>,
or search for "Terminal" using Spotlight (CMD + Space).

#### Installing Homebrew (macOS only)

In the next lesson regarding git and github, you will need the `brew` command. Homebrew ("brew") is a package manager for macOS that makes it easy to install and manage software.

If you don't have Homebrew installed, install it by running:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Verify Homebrew is installed

Run:

```bash
brew --version
```

Expected: prints a Homebrew version string (e.g., "Homebrew 4.x.x").

Re-run `brew --version`. If still missing, install Homebrew from https://brew.sh and restart your terminal.

</details>

<details>
  <summary><strong style="font-size: 24px">Linux</strong></summary>

Open your terminal, and you should be good to go to continue to the next section.

</details>

### Basic Commands (works on both Mac, Linus and WSL)

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
| `code .`          | Open default Code Editor                     |

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

> **⚠️ Warning:**
> The command `rm -r terminal_test` will **permanently delete** the `terminal_test` folder and everything inside it, **without asking for confirmation**. Be very careful when using `rm -r`—double-check the folder name to avoid deleting important files or directories.

```bash
cd ..
rm -r terminal_test
ls
```

**Verify**: The `terminal_test` folder should be gone

If all verifications passed, you're ready for the next guide: [Git and GitHub](git-github.md)
