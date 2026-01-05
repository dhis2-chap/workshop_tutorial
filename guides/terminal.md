# Working on the Terminal

## Open terminal

The terminal (also called command line or shell) is a text-based interface for interacting with your computer. Learning basic terminal skills is essential for working with Git, running scripts, using development tools and **Chap**.

<details>
  <summary><strong style="font-size: 24px">Windows</strong></summary>

To use Chap CLI later on a Windows machine, you need to install the Windows Subsystem for Linux (WSL).

Windows Subsystem for Linux (WSL) allows you to run a Linux environment on your Windows machine without the need for a separate virtual machine or dual booting. Read more about WSL [here](https://learn.microsoft.com/en-us/windows/wsl/about).

1. Start **PowerShell** by searching for it in the Start Menu in Windows  
   <img src="image.png" alt="PowerShell Start Menu" width="400" />

2. Within the shell, execute:

   ```bash
   wsl --install
   ```

3. Restart your computer

4. Search for and open “Ubuntu” from the Start menu. You now have access to Ubuntu command line, which is a Linux distribution, allowing you to execute Linux commands.

</details>

<details>
  <summary><strong style="font-size: 24px">Mac / Linux</strong></summary>

Open the <strong>Terminal</strong> application.

On macOS, you can find it in
<strong>Applications → Utilities → Terminal</strong>,
or search for “Terminal” using Spotlight (CMD + Space).

</details>

## Navigation Tips

- Use `Tab` to autocomplete file and folder names
- Use the up/down arrow keys to scroll through previous commands
- Use `Ctrl+C` to cancel a running command
- Use `clear` to clear the terminal screen

## Basic Commands

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
