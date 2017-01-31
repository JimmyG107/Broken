set /p user=Who is this?  (lowercase first name please):
git checkout master
git pull origin master
git merge %user%
git push origin master
pause