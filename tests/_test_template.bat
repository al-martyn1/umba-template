@set TEST_NAME=
call "%~dp0\.find_test_exe.bat" %TEST_NAME%
@echo FOUND_EXE: %FOUND_EXE%
@set TEST_EXE=%FOUND_EXE%

%TEST_EXE%  < "%~dp0\%TEST_NAME%.txt" > "%~dp0\%TEST_NAME%.log" 2>&1
