# stop the browser's password manager and Chrome's data-breach popup


def get_chrome_options(headless="false"):
    from selenium.webdriver import ChromeOptions
    options = ChromeOptions()
    prefs = {
        "credentials_enable_service": False,
        "profile.password_manager_enabled": False,
        "profile.password_manager_leak_detection": False,
    }
    options.add_experimental_option("prefs", prefs)
    options.add_argument("--disable-features=PasswordLeakDetection")
    options.add_argument("--no-first-run")
    options.add_argument("--no-default-browser-check")
    if str(headless).lower() == "true":
        options.add_argument("--headless=new")
    return options


def get_firefox_options(headless="false"):
    from selenium.webdriver import FirefoxOptions
    options = FirefoxOptions()
    options.set_preference("signon.rememberSignons", False)
    if str(headless).lower() == "true":
        options.add_argument("-headless")
    return options
