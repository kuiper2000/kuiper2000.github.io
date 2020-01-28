#!/bin/sh
#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

## Commit changes to website repo.
#git add .
#msg="rebuilding site `date`"
#git commit -m "$msg"
#git push origin master

## Build the project.
#hugo -t academic # if using a theme, replace with `hugo -t <YOURTHEME>`

## Go To Public folder
#cd public
## Add changes to git.
#git add .

## Commit changes.
#msg="rebuilding site `date`"
#if [ $# -eq 1 ]
#  then msg="$1"
#fi
#git commit -m "$msg"

## Push source and build repos.
#git push origin master

## Come Back up to the Project Root
#cd ..


hugo
cd public 
git remote rm origin
git init
git remote add origin https://github.com/kuiper2000/kuiper2000.github.io.git
git add .
git commit -m "Initial commit"
git push -u origin master --force

cd ../
git remote rm origin
git init
git fetch origin master
git merge origin master
git remote add origin https://github.com/kuiper2000/website-hugo.git
git add .
git commit -m "Initial commit"
git push -u origin master --force
