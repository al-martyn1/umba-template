@set UMBA_MDPP_EXTRA_OPTIONS="--batch-page-index-file=%~dp0doc\pages_index.md"
@call "%~dp0.bat\make-cli-options-docs.bat"
@rem call "%~dp0\.bat\fix_tabs.bat"
@call "%~dp0\.bat\gen-doc.bat"
