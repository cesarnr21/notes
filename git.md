
[Some Cool New instructions](https://www.atlassian.com/git/tutorials/saving-changes/gitignore)

> note: it is neccessary to input the username and commit token everytime you pull and push a private repository

### Questions that need answering
- .gitignore
- Why fork a repository
- how to handle using code from another repository
- Git Stash

### Submodules
To add a git submodule use: `git submodule add git@github.com:user/path`
this creates a `.gitmodules` file that sotres the mapping between the project's URL and the modules

to load the submodule, use `git submodule init` and then `git submodule update`

### Exclude Files for Commit
To untrack a directory use `git rm --cached file_name.file_type`
To ignore files add them either to `.gitignore` or to `.git/info/exclude`
Difference: .gitignore is pushed to the repo whereas `.git/info/exclude` is not


---------------------------------------------------

# Basic Instructions:

- `git init`: creates a new repository
- `git clone`: clones the repository to the current directory
- `git status`: shows you the changes made and the ones that are added
- `git add <filename.filetype>`: adds the actions to the working tree
- `git branch`: shows you the lists of branches
- `git branch <branch_name>`: creates a new branch
> Note: this not add a remote branch. to do this use the command:*`git push --set-upstream origin <branch name>`*

- `git branch -d <branch_name>`: deletes the branc
> Note: this not delete the remote branch on the repository. this can be done the github reposioty website

- `git checkout <branch_name>`: switches you to the selected branch
- `git pull`: it will download content from the repository and update the local repo to match it
- `git push`: makes the changes permanent and publishes them in the branch
- `git commit`: commits the changes to the branch
- `git merge <branch_name>`: brings the changes from that branch into the current branch
- `git reset`: 
- `git fetch`:

If you have a local repository and want to add it to a remote, use:
```sh
git remote add origin git@github.com:repo_link.git
git branch -M main
git push -u origin main
```

