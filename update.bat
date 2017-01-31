set /p user=Who is this?  (lowercase first name please):
git checkout %user%
git add -A
git commit -m "%user% %date% %time%"
git push origin %user%
pause