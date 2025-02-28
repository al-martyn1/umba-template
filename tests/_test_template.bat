@set TEST_NAME=
call "%~dp0\.find_test_exe.bat" %TEST_NAME%
@echo FOUND_EXE: %FOUND_EXE%
@set FOUND_EXE=%FOUND_EXE:"=%
@if "%FOUND_EXE%"=="" @goto NOT_FOUND
@set TEST_EXE="%FOUND_EXE%"
%TEST_EXE% "%~dp0\input.txt"  > %TEST_NAME%-01.log 2>&1


exit /B 0
:NOT_FOUND
@echo Test executable not found
