# Workshop Tutorial Plan

## User Story

**January 7th:** Person comes in to the January 7th webinar, gets advised to learn to use git and GitHub basics. As homework they have to (either alone, or in a team):

- Get started on the command line (install WSL if they are on Windows)
- Make a GitHub user
- Fork either a Python model repo or the R model repo
- Clone that after forking
- Make a small change to the model and push the change to their fork (and maybe post on CoP when the homework is done)

> **Idea:** Use the CoP to post questions when doing homework

---

## Action Points (January 7th)

- [ ] Knut makes the homework (with guides either inline or as links)
  - Should contain a minimal homework and a recommended (where you do a bit more playing around with the code/git maybe)
- [ ] Herman and other people try out this homework
- [ ] GK and Knut makes the hour-long webinar
- [ ] Someone make a CoP post when we are close to the webinar

---

## January 14th

Person comes to January 14th webinar (with knowing a bit command line and Git) and wants to try to run a very small model. They now have a minimal model on their computer, but have not run it yet. They will get advised on setting up an environment with either R and Python and a way to install dependencies.

### Homework

- Run either `python isolated_example.py` or similar for R
- Look at output (`head predictions.csv`)
- Maybe try small changes to code and rerun
- Push changes to git
- Install chap-core and run `chap evaluate` with `--skip-environment`

---

## Action Points (January 14th)

- [x] **Knut:** Workshop example repositories created:
  - https://github.com/dhis2-chap/chap-workshop-python
  - https://github.com/dhis2-chap/chap-workshop-r
- [ ] Go through these tutorials in early January
- [ ] Decide on how we want to recommend people to install Python/R (this also needs tutorials, or links to tutorials)
  - For chap-core we kind of need `uv`, so that should then be the recommended approach for Python packages
- [ ] We need to think about having same approach for climate tools and the webinar here (so we can use the same guides)
- [ ] We need: A bigger open dataset with climate data and disease data
- [ ] **Knut:** Guide on using the new CLI for doing evaluations on the command line
