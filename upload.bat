set /p user=Who is this?  (lowercase first letter):
if ("%user%"=="j")
(
     set user=james
)
if ("%user%"=="c")
(
     set user=cameron
)
if ("%user%"=="r")
(
     set user=raymond
)
if ("%user%"=="d")
(
     set user=david
)
git checkout master
git pull origin master
git merge %user%
git push origin master
git checkout %user%
git merge master
git push origin %user%
pause