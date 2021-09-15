@echo Backup database  

SET PG_BIN="D:\Users\hadjhabib_s\AppData\Roaming\PostgreSQL\13\bin\pg_dump.exe"
SET PG_HOST=10.20.10.18
SET PG_PORT=5435
SET PG_DATABASE=distru
SET PG_USER=Biuser
@REM SET PG_PASSWORD=Avengers
SET PG_PATH=D:\Users\hadjhabib_s\Desktop\pest

for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set fmonth=00%Month%
set fday=00%Day%
set today=%Year%-%fmonth:~-2%-%fday:~-2%

SET FECHAYHORA=%date:/=%-%time:-0,8%
SET FECHAYHORA=%FECHAYHORA::=-%
SET FECHAYHORA=%FECHAYHORA: =0%
set datestr=backup_%year%_%month%_%day%_%hour%_%min%
SET PG_FILENAME=%PG_PATH%\backup_%today%.sql

%PG_BIN% -h %PG_HOST% -p %PG_PORT% -U %PG_USER% %PG_DATABASE%  > %PG_FILENAME%

@echo Backup Taken Complete %PG_FILENAME%

pause