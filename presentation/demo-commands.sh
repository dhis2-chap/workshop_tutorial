#!/bin/bash
# Interactive demo script for CHAP Workshop
# Run each section manually or use: source demo-commands.sh
#
# TIP: Copy-paste sections during the live demo

# ============================================
# TERMINAL DEMO COMMANDS
# ============================================

# --- Slide 8: pwd & ls ---
pwd
ls

# --- Slide 9: mkdir & cd ---
mkdir workshop_test
cd workshop_test
pwd

# --- Slide 10: touch & ls ---
touch hello.txt
ls

# --- Slide 14: Clean up ---
cd ..
rm -r workshop_test
ls

# ============================================
# GIT DEMO COMMANDS
# ============================================

# --- Pre-requisite: Configure git ---
# git config --global user.name "Your Name"
# git config --global user.email "your.email@example.com"
# gh auth login

# --- Slide 22: Clone ---
cd ~
git clone https://github.com/YOUR-USERNAME/chap-workshop-python.git
cd chap-workshop-python
ls

# --- Slide 23: Check status ---
git status

# --- Slide 24: Edit a file ---
# Open README.md and add:
#   ## My Notes
#   Testing git workflow!
# Save the file

# --- Slide 25: Status again ---
git status

# --- Slide 26: Stage ---
git add README.md
git status

# --- Slide 27: Commit ---
git commit -m "Add my notes to README"

# --- Slide 28: Push ---
git push

# ============================================
# VERIFICATION
# ============================================
# Visit: https://github.com/YOUR-USERNAME/chap-workshop-python
# Your change should appear in the README!
