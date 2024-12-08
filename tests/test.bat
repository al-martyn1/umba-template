@call "%~dp0\..\.bat\setup_out_root_paths.bat"
@echo OUTROOTPATH=%OUTROOTPATH%

exit /B 0

@if exist %~dp0\_setup.bat @call %~dp0\_setup.bat
%PP% %CMNOPTS% --processing-options=generate-toc test01.md_ test01.md > test01.log

