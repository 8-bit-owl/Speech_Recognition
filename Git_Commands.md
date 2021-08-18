# Introduction
This file has all the basic commands relates to git. Git bash can be downloaded from the link below
/////git download link


# Git Commands
The following commands can be used to access, modify and undo the changes to the software that you are working on. Git has many features, but here are some of the useful ones used to maintain software.

```
git init
```
This command is for initializing the git repository. The folder where you call this command, there will be a repository and all the tagging is done by using the created .git folder.
If you want to upload the present direcoty to a git repository or download a git repository that you will be working on, this is the first command that has to be executed in the git bash.

```
git clone "repostitory url"
```
This command is for cloning the repository from online onto your local PC, where we can work and make changes. On top right of the repository, you can see the green code button and when we clicked, it will gove the url of the code. HTTPS is better but even SSH works copy the url and replace it in the repository url and it will download the code into your local directory.

```
git add .
```
This command is for adding files into the repository. The "." after add is for adding all the newly created files. If we want to add only specific files, we need to mention the file name seperately.

```
git add Filename1
git add Filename2
```
This command is for adding only specific files. It is better to use "git add ." to avoid merge issues in future.

```
git commit -m "commit message"
```
This command is for moving files to staging area. This is like, you have added files and you are now commiting changes to the existing code in the repository in git cloud.

```
git push
```
This command actually changes the code in the git cloud. Once this command is executed, we should be able to see the changes in the browser.

