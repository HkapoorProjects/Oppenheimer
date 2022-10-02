# HkapoorProjects
Repository for Test Automation using Robot Framework.

The central objective is to implement End to End Integration tests across products and platforms. Teams can also implement Functional Tests specific to their application.


## Pre-Requisites
  - Chromedriver (for latest chrome version , ChromeDriver 81.0.4044.69)
  - Always create requirements.txt file and add all the dependency
  - corresponding drivers for other browsers (if you are interested in cross browser testing)


## Installation Instructions

## Create Virtual Environment 
Once you have cloned the <Repository> and have python3 installed. You can use virtual environment to manage your <Repository> dependencies separately. For this you can use venv, pyenv and more.

You can create a virtual environment in your local <Repository> directory itself.

For venv, follow the steps below:

```sh
cd <Repository>
```

```sh
python3 -m venv .venv
```

This will create .venv directory for your virtual environment in <Repository>.  

To use your virtual environment you will need to activate it. 

NOTE: Update the command in case you have a virtual environment with a different name or at a different location.

```sh
source .venv/bin/activate
```

## Install dependencies
For running and creating tests you will need to install dependencies. Dependencies are specified in requirements.txt file. You can install them with the following command:

NOTE: Make sure you are installing the packages in the virtual environment if you are using any. So as to not conflict with other projects. If  the virtual environment is not running you can activate it as explained above.

```sh
pip3 install -r requirements.txt
```

## Additional requirements
-   ### Chromedriver
    For running UI test cases you will need to download chromedriver. Check your current chrome version and download a relevant chromedriver from https://chromedriver.chromium.org/downloads.

## Some Points which was not clear:
- ###  There is no documentation regarding the type of records
- ###  While running the post api for multiple record entry, dev mistakenly use https instead of http for local testing
- ###  Post request should thow an error when length of 'NATID' is less than 4 char, rather breaking the index call






## Reference documents
| Ref. | README |
| ------ | ------ |
| About Robot Framework | https://robotframework.org/ |
| Robot Framework User Guide | https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html |
| Robot Framework built-in Library | https://robotframework.org/robotframework/latest/libraries/BuiltIn.html |
| Robocop | https://robocop.readthedocs.io/en/stable/ |
| Robotidy | https://robotidy.readthedocs.io/en/latest/index.html |
| Selenium Library | https://github.com/robotframework/SeleniumLibrary |
| Chrome driver | https://chromedriver.chromium.org/downloads |
