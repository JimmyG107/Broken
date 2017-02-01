@echo off
set /p user=Who is this?  (lowercase first letter):
if %user%==j (set user=james;echo Hello James)
if %user%==c(set user=cameron;echo Hello Cameron)
if %user%==r(set user=raymond;echo Hello Raymond)
if %user%==d(set user=david;echo Fuck you David)
git checkout master
git pull origin master
git checkout %user%
git merge master
git push origin %user%
pause