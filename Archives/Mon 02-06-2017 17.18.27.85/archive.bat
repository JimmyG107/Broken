set datetime=%date:/=-% %time::=.%
xcopy D:\Broken D:\"%datetime%" /s /exclude:excluded.txt /i
move D:\"%datetime%" D:\Broken\Archives