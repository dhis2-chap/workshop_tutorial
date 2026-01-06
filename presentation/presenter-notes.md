# Presenter Notes: CHAP Workshop

## Before the Presentation

### Setup Checklist

- [ ] Open terminal in full screen (or large window)
- [ ] Increase terminal font size (Cmd/Ctrl + for bigger)
- [ ] Open VS Code (or your preferred editor)
- [ ] Log into GitHub in browser
- [ ] Have chap-python-sdk repo page open: https://github.com/knutdrand/chap-python-sdk
- [ ] Test `gh auth status` - ensure you're authenticated
- [ ] Clean up home directory (delete any workshop_test or chap-python-sdk folders from previous runs)
- [ ] Open slides: `open presentation/index.html` (or use Live Server in VS Code)
- [ ] Press `s` to open speaker notes view

### Pre-flight Commands

Run these before presenting to ensure clean state:

```bash
cd ~
rm -rf workshop_test terminal_test chap-python-sdk
gh auth status  # Should show "Logged in to github.com"
```

---

## Presentation Flow

### Section 1: Intro (3 min)

**Slides 1-3**

Key points:
- This is follow-along - if stuck, homework has everything
- Goal: get comfortable with terminal and git basics
- These skills are required for working with CHAP

---

### Section 2: Terminal (12 min)

**Slides 4-11**

#### Slide 5: What is the Terminal?
- "Instead of clicking through folders, you type commands"
- It's faster once you're used to it

#### Slide 6: Opening the Terminal
- **Ask:** "Everyone open your terminal now"
- Wait 30 seconds
- Windows users: Search for "WSL" or "Ubuntu" in start menu
- Mac users: Cmd+Space, type "Terminal"

#### Slide 7: Essential Commands
- Walk through the table slowly
- "pwd = print working directory = where am I"
- "ls = list = what's here"

#### Slide 8: Live Demo - pwd & ls

**DEMO COMMANDS:**
```bash
pwd
```
Expect: `/Users/yourname` or `/home/yourname`

```bash
ls
```
Expect: Desktop, Documents, Downloads, etc.

#### Slide 9: Live Demo - mkdir & cd

**DEMO COMMANDS:**
```bash
mkdir workshop_test
cd workshop_test
pwd
```
Expect: Path now ends with `workshop_test`

Pause: "Did everyone's path change?"

#### Slide 10: Live Demo - touch & ls

**DEMO COMMANDS:**
```bash
touch hello.txt
ls
```
Expect: `hello.txt` appears

#### Slide 11: Navigation Tips
- Demo Tab completion: type `cd work` then Tab
- Demo up arrow for history
- Mention Ctrl+C for stopping commands

---

### Section 3: Terminal Exercise (8 min)

**Slides 12-15**

#### Slide 12: Follow Along - Part 1

Walk through slowly. Wait for confirmations.

**Commands:**
```bash
pwd
ls
mkdir terminal_test
cd terminal_test
pwd
```

Check: "Does your path end with terminal_test? Thumbs up if yes."

#### Slide 13: Follow Along - Part 2

**Commands:**
```bash
touch hello.txt
ls
```

Check: "Do you see hello.txt?"

#### Slide 14: Clean Up

**Commands:**
```bash
cd ..
rm -r terminal_test
ls
```

**WARNING:** Emphasize that `rm -r` is permanent!
- "Double check what you're deleting"
- "There's no trash can - it's gone forever"

#### Slide 15: Checkpoint
- Ask if anyone got stuck
- Point to guides/terminal.md for full reference

---

### Section 4: Git Concepts (7 min)

**Slides 16-20**

#### Slide 17: GitHub vs Git
- GitHub = website (show in browser)
- Git = terminal tool
- Common confusion - emphasize the difference

#### Slide 18: Key Concepts
- **Repository** = project folder
- **Fork** = your copy on GitHub
- **Clone** = download to your computer

Draw if helpful:
```
Original Repo (GitHub) --> Fork (Your GitHub) --> Clone (Your Computer)
```

#### Slide 19: The Workflow
- Fork → Clone → Edit → Commit → Push
- "This is what you'll do every time"

#### Slide 20: Why This Matters
- Backup, history, undo, sharing
- "Git is your safety net"

---

### Section 5: Git Demo (15 min)

**Slides 21-28**

#### Slide 21: Fork on GitHub

**DEMO:**
1. Go to https://github.com/knutdrand/chap-python-sdk
2. Click "Fork" button (top right)
3. Select your account
4. Wait for fork to complete

Ask: "Does everyone have their own copy now? URL should be github.com/YOUR-USERNAME/chap-python-sdk"

Give 2 minutes for this.

#### Slide 22: Clone

**DEMO COMMANDS:**
```bash
cd ~
git clone https://github.com/YOUR-USERNAME/chap-python-sdk.git
cd chap-python-sdk
ls
```

**Important:** Replace YOUR-USERNAME with your actual username!

#### Slide 23: Check Status

**DEMO COMMANDS:**
```bash
git status
```

Expect: "On branch main... nothing to commit"

Explain: "git status is your best friend - use it constantly"

#### Slide 24: Edit a File

**DEMO:**
1. Run `code .` to open VS Code (or use any editor)
2. Open README.md
3. Add at the bottom:
```markdown
## My Notes
Testing the git workflow!
```
4. Save the file (Cmd/Ctrl + S)

#### Slide 25: Status Again

**DEMO COMMANDS:**
```bash
git status
```

Expect: README.md shown in red as "modified"

"Red means changed but not staged"

#### Slide 26: Stage Changes

**DEMO COMMANDS:**
```bash
git add README.md
git status
```

Expect: README.md now in green

"Green means staged and ready to commit"

#### Slide 27: Commit

**DEMO COMMANDS:**
```bash
git commit -m "Add my notes to README"
```

Explain: "The message describes what you changed. Be descriptive!"

#### Slide 28: Push

**DEMO COMMANDS:**
```bash
git push
```

Then:
1. Go to your fork on GitHub
2. Refresh the page
3. Scroll down to see your change in the README

"Your change is now on GitHub!"

---

### Section 6: Git Exercise (10 min)

**Slides 29-31**

#### Slide 29: Follow Along

Give people time to catch up. Walk around (if in person) or ask for status in chat.

Check each step:
1. "Who has forked the repo?"
2. "Who has cloned it?"
3. "Who has edited README.md?"
4. "Who has pushed to GitHub?"

#### Slide 30: Quick Reference

Keep this slide visible while people work.

#### Slide 31: Common Issues

**Permission denied:**
```bash
gh auth login
```
Select: GitHub.com → HTTPS → Yes → Login with browser

**Wrong URL:**
- Must be YOUR fork: github.com/YOUR-USERNAME/chap-python-sdk
- Not the original: github.com/knutdrand/chap-python-sdk

**Nothing to commit:**
- Did you save the file in your editor?
- Check `git status` - is the file shown as modified?

---

### Section 7: Wrap-Up (5 min)

**Slides 32-36**

#### Slide 33: What We Covered
- Quick recap

#### Slide 34: Coming Next
- Mention virtual environments and pull requests
- "We'll cover these in future sessions"

#### Slide 35: Homework
- Point to homework/january-7.md
- "The guides have everything step-by-step"
- "Final check: your change appears on your GitHub fork"

#### Slide 36: Questions
- Take questions
- Point to Community of Practice for async questions

---

## Troubleshooting Guide

### Git not installed

**Mac:**
```bash
brew install git
```

**Linux/WSL:**
```bash
sudo apt update && sudo apt install git
```

### gh not installed

**Mac:**
```bash
brew install gh
```

**Linux/WSL:**
```bash
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
&& cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

### "fatal: repository not found"

- Check the URL - typo in username?
- Is the repo public?
- Did you fork it first?

### "Updates were rejected"

```bash
git pull
```
Then try pushing again.

### WSL issues

- Make sure WSL is installed: `wsl --install` in PowerShell
- Restart computer after installing
- Open WSL by typing `wsl` in PowerShell

---

## Timing Summary

| Section | Duration | Cumulative |
|---------|----------|------------|
| Intro | 3 min | 3 min |
| Terminal | 12 min | 15 min |
| Terminal Exercise | 8 min | 23 min |
| Git Concepts | 7 min | 30 min |
| Git Demo | 15 min | 45 min |
| Git Exercise | 10 min | 55 min |
| Wrap-up | 5 min | 60 min |

**Buffer:** The Git exercise can flex - if running long, cut it short and emphasize homework.
