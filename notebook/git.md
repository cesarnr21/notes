**Some useful references**
- **[Learn Git Branching](https://learngitbranching.js.org/?locale=en_US)**
- **[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)**

### Learn More
* [ ] `git stash`
    + `apply`
    + `pop`
    + `clean`
* [ ] `git commit --amend` vs using `git rebase`
* [ ] `git rebase -i` and `git rebase --continue`
    + `drop`
    + `squash`
    + `edit`
    + `pick`
* [ ] `git fetch`
* [ ] Using `git tags`

### Table of Contents
* [Notes](#notes)
  * [Some setup](#some-setup)
  * [githooks](#githooks)
* [Basic Instructions:](#basic-instructions)
    * [Git Pull vs Fetch](#git-pull-vs-fetch)
    * [Difference between HEAD, remote, and main](#difference-between-head-remote-and-main)
    * [Squash Commits](#squash-commits)
    * [Squash Commits and Rebase with Main](#squash-commits-and-rebase-with-main)
    * [Sync Forked Repositories](#sync-forked-repositories)
    * [Submodules](#submodules)
    * [Exclude Files for Commit](#exclude-files-for-commit)


# Notes

## Some setup
- Set **vim** as default git monitor 
    > **source: <https://stackoverflow.com/questions/2596805/how-do-i-make-git-use-the-editor-of-my-choice-for-editing-commit-messages>**
    ```sh
    $ git config --global core.editor "vim"
    ```

- set **meld** as diff and merge tool
    > **source: <https://stackoverflow.com/questions/34119866/setting-up-and-using-meld-as-your-git-difftool-and-mergetool>**
    ```sh
    # find meld path using
    which meld

    git config --global diff.tool meld
    git config --global difftool.meld.path "/path/meld"

    git config --global merge.tool meld
    git config --global mergetool.meld.path "/path/meld"

    # NOTE: leave promt as true to go through questions
    git config --global difftool.prompt false
    git config --global mergetool.prompt false
    ```

## githooks
githooks can be added under the `.git/hooks/` folder, however these are tracked by 

---------------------------------------------------

# Basic Instructions:
To see basic commands use `git --help`. To see help with specific command, do `git [ command ] --help`


- `git init`: creates a new repository
- `git clone`: clones the repository to the current directory
- `git status`: shows you the changes made and the ones that are added

 
- `git add [ filename.filetype ]`: adds the actions to the working tree
    - `git add --all` to add all changes to working tree
    - `git restore --staged [ file_name ]` to remove from working tree

| **Command** | **New Files** | **Modified Files** | **Deleted Files** | **Notes** |
|---|---|---|---|---|
| `git add --all` or <br>`git add -A` | :white_check_mark: | :white_check_mark: | :white_check_mark: | stage all changes (new, modified, deleted files) |
| `git add .` | :white_check_mark: | :white_check_mark: | :white_check_mark: | stage all changes in current directory |
| `git add --update` or <br>`git add -u` | :x: | :white_check_mark: | :white_check_mark: | stage modified and deleted files that <br>were already being tracked |
| `git add --ignore-removal` | :white_check_mark: | :white_check_mark: | :x: | staged new and modified files (no deletetions) |


- `git branch`: shows you the lists of branches and highlights current branch
    - `git branch -r` shows all remote branches
- `git branch [ branch_name ]`: creates a new branch
> Note: this not add a remote branch. to do this use the command:*`git push --set-upstream origin [ branch name ]`*

- to create a new branch without any commits: `git branch --oprhan`

- `git branch -d [ branch_name ]`: deletes the branc
> Note: this not delete the remote branch on the repository. this can be done the remote reposioty

- `git checkout [ branch_name ]`: switches you to the selected branch
- `git pull`: it will download content from the repository and update the local repo to match it
    - `git pull --all` will pull from all remote branches 
- `git push`: makes the changes permanent and publishes them in the branch
- `git commit`: commits the changes to the branch
- `git merge [ branch_name ]`: brings the changes from that branch into the current branch
- `git log` shows all commit history, displays commit messages, author, and date/time
- `git clean` Remove untracked files from the working tree
- `git diff` shows changes before file is added to working tree
    - `git diff --cached` for files added to working tree

If you have a local repository and want to add it to a remote, use:
```sh
$ git remote add origin git@github.com:repo_link.git
$ git branch -M main
$ git push -u origin main
```

### Git Pull vs Fetch
`git fetch` will get changes from the remote branch (how to view these?)

`git pull` on will perform both `git fetch` and `git merge`


### Difference between HEAD, remote, and main

### Squash Commits
**[Link](https://stackoverflow.com/questions/5308816/how-can-i-merge-multiple-commits-onto-another-branch-as-a-single-squashed-commit)**
```sh
$ git reset soft [ brach_name or commit ]      # deletes all commits from then but keeps changes
# then commit all changes as a single commit, then push
$ git commit -m 'commit_message'
$ git push
# note: if pushing to a remote branch with squashed commits, then:
$ git push --force
```

### Squash Commits and Rebase with Main
```sh
# first check changes that have taken places since the branches separated
$ git log HEAD..main

# review the commits and squash them
$ git rebase -i main

# use to check the new squashed git log
$ git log main..HEAD

$ git push --force
```

### Sync Forked Repositories
**<https://stackoverflow.com/questions/7244321/how-do-i-update-or-sync-a-forked-repository-on-github>**

### Submodules
To add a git submodule use: `git submodule add git@github.com:user/path`
this creates a `.gitmodules` file that sotres the mapping between the project's URL and the modules

to load the submodule, use `git submodule init` and then `git submodule update`

### Exclude Files for Commit
To untrack a directory use `git rm --cached file_name.file_type`
To ignore files add them either to `.gitignore` or to `.git/info/exclude`
Difference: `.gitignore` is pushed to the repo whereas `.git/info/exclude` is not
