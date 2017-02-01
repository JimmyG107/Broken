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
git checkout %user%
git add -A
git commit -m "%user% %date% %time%"
git push origin %user%
pause