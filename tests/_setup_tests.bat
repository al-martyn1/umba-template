@call "%~dp0\..\.bat\setup_out_root_paths.bat"
@if exist "%~dp0\..\set_sln.bat" @call "%~dp0\..\set_sln.bat"
@set SLN_EXE=%OUTROOTPATH%\%SLN%.exe
