set /p user=Who is this?  (lowercase first letter):
if %user%==j set user=james
if %user%==c set user=cameron
if %user%==d set user=david
if %user%==r set user=raymond
if %user%==t set user=tanner
echo Hello, %user%