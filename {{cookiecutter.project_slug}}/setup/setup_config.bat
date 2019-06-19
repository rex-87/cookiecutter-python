@echo off
REM # -----------------------------------------------------
REM # USER-DEFINED VARIABLES
REM # -----------------------------------------------------
SET ENVIRONMENT_NAME={{cookiecutter.project_slug}}_env
SET ENVIRONMENT_ARCHITECTURE={{cookiecutter.environment_architecture}}
SET PYTHON_VERSION={{cookiecutter.python_version}}
SET PYTHON_DEPENDENCIES={{cookiecutter.python_dependencies}}

REM # -----------------------------------------------------
REM # SYSTEM-DEFINED VARIABLES
REM # -----------------------------------------------------
SET MINICONDA_DOWNLOAD_FOLDER=%UserProfile%\Downloads
IF %ENVIRONMENT_ARCHITECTURE%==64-bit (

	IF %PYTHON_VERSION:~0,1%==3 (
		SET MINICONDA_INSTALL_FOLDER=%UserProfile%\miniconda3_64
		SET MINICONDA_SETUP_FILENAME=Miniconda3-latest-Windows-x86_64.exe
	) ELSE IF %PYTHON_VERSION:~0,1%==2 (
		SET MINICONDA_INSTALL_FOLDER=%UserProfile%\miniconda2_64
		SET MINICONDA_SETUP_FILENAME=Miniconda2-latest-Windows-x86_64.exe
	) ELSE (
		echo Invalid PYTHON_VERSION: %PYTHON_VERSION%
	)
	
) ELSE IF %ENVIRONMENT_ARCHITECTURE%==32-bit (
	
	IF %PYTHON_VERSION:~0,1%==3 (
		SET MINICONDA_INSTALL_FOLDER=%UserProfile%\miniconda3_32
		SET MINICONDA_SETUP_FILENAME=Miniconda3-latest-Windows-x86.exe
	) ELSE IF %PYTHON_VERSION:~0,1%==2 (
		SET MINICONDA_INSTALL_FOLDER=%UserProfile%\miniconda2_32
		SET MINICONDA_SETUP_FILENAME=Miniconda2-latest-Windows-x86.exe
	) ELSE (
		echo Invalid PYTHON_VERSION: %PYTHON_VERSION%
	)
	
) ELSE (
	echo Invalid ENVIRONMENT_ARCHITECTURE: %ENVIRONMENT_ARCHITECTURE%
)
SET MINICONDA_DOWNLOAD_URL=https://repo.anaconda.com/miniconda/%MINICONDA_SETUP_FILENAME%	
SET ENVIRONMENT_FOLDER=%MINICONDA_INSTALL_FOLDER%\envs\%ENVIRONMENT_NAME%
