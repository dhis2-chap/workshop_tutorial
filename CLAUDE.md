# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Jira:** CLIM-293

## Repository Overview

This is a documentation repository containing tutorial guides for CHAP (Climate Health Analysis Platform) workshop participants. It teaches basic skills needed to work with CHAP: terminal usage, Git, GitHub, and virtual environments.

## Structure

- `guides/` - Tutorial guides (terminal, git, github, pull-requests, virtual-environments)
- `homework/` - Homework assignments tied to specific workshop dates
- `PLAN.md` - Workshop planning document with action items and user stories

## Guide Structure

Each guide follows this structure:
1. **Why?** - Motivation for learning the topic
2. **What is [topic]?** - Conceptual explanation
3. **How?** - Practical usage with examples
4. **Exercise** - Tasks with clear verification steps (e.g., "run `ls`, you should see files")

Homework files link to the guides and reference their exercises.

## Content Guidelines

When editing guides:
- Target audience is beginners new to command line, Git, and development workflows
- Guides are cross-platform (macOS, Linux, Windows/WSL)
- Include practical examples with copy-pasteable commands
- Link between related guides (e.g., terminal → git → github → pull-requests)
- Reference the CHAP workshop repositories: `dhis2-chap/chap-workshop-python` and `dhis2-chap/chap-workshop-r`
- Exercise verification steps should be clear and testable

## Tool Recommendations

The guides recommend specific tools:
- Python: `uv` for package/environment management
- R: `renv` for package management
- GitHub CLI: `gh` for repository operations
- Docker: for containerization when full reproducibility is needed
