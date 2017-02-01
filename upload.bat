call getUser
git checkout master
git pull origin master
git merge %user%
git push origin master
git checkout %user%
git merge master
git push origin %user%
pause