@echo off
REM - Setup environment for main program
call %~dp0\setup\setup.bat

@echo off
REM - Generate new project in user directory
call %MINICONDA_INSTALL_FOLDER%\Scripts\activate.bat %ENVIRONMENT_FOLDER% && cookiecutter %~dp0 -o %UserProfile%