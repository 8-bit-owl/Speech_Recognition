# Introduction
This file has all the basic commands related to git. All the commands below are to be executed in the Git bash. Git bash can be downloaded from the link below

WINDOWS download link
```
https://git-scm.com/download/win 
```


# Useful git Commands
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
git remote add upstream "repository url"
```
This command connects the local working directory to the central one in the git cloud.

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

# Making changes for individual development
```
git clone "repository url"                           // clone your repo
git remote add upstream "repository url"  // Git set upstream. Which connects the local direcoty to Central repo.
git add .                                 // you add files, or make you changes.
git commit -m "message"                   // commit your changes with the message.
git push                                  // actually push your changes to git repo.
```
If one has to just make changes to the existing repo, the above commands are enough. These are major commands used in git.
![image](https://user-images.githubusercontent.com/20287036/129835495-286cb9b2-148c-425b-b092-c55f095eaace.png)

# What if multiple people work on git.
Git is intended for streamlining the porcess of software development. So, any number of developers can make changes and software can be moved to previous version when there is a problem. There below are some useful commands.

```
git fetch
```
This command allows you to see if there are any changes to the current git repo in the cloud. Suppose you have checked the code yesterday and there were some changes today and some other person has pushed changes. So to check if the current local project is upto date with the one in cloud, we need to execute this command. Sometimes, the changes would clash and files are overwritten, so it is always healthy to fetch and see before commiting our changes to the code.

Git fetch would show you if there are any changes after you have cloned the project. It will resemble somwthing like this.
```
remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), 1.40 KiB | 159.00 KiB/s, done.
From https://github.com/8-bit-owl/Speech_Recognition
   5f4d923..4339397  master     -> origin/master
```

```
git pull
```
If you have fetched and there are some changes that you need, you can run the above command for the changes. Fetch and Pull should be the first commands that should be executed before you make changes to the local directory becasue there is a chance that the changes will be overwritten by git commands.



