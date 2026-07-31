*** Settings ***
Documentation    Settings and test data. Override with -v NAME:value or env vars.

*** Variables ***
${URL}             https://www.saucedemo.com

${BROWSER}         %{BROWSER=chrome}
${HEADLESS}        %{HEADLESS=false}

${USERNAME}        %{SAUCE_USERNAME=standard_user}
${PASSWORD}        %{SAUCE_PASSWORD=secret_sauce}

${FIRST_NAME}      %{FIRST_NAME=Saad}
${LAST_NAME}       %{LAST_NAME=Tozibar Rahman}
${ZIP_CODE}        %{ZIP_CODE=12103}

${TIMEOUT}         5s
