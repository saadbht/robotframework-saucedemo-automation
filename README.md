# Complete Purchase Flow for Saucedemo (Robot Framework + Selenium)

End to end test (happy path) for saucedemo.com. It logs in, sorts by price, adds the 2nd
and 3rd cheapest items, checks the cart, fills checkout, verifies the item
total, and confirms the success message after ordering.

## Structure

```
tests/purchase_flow.robot     The main test file
resources/config.robot        URL, browser, login, timeout (configurable)
resources/common.robot        Opens/closes the browser
resources/pages/              One Page Object per page
libraries/price_utils.py      Sums prices
docs/reasoning.md             Notes
```

## Setup and run

Needs Python 3.9+ and Chrome / Firefox. No driver setup needed.

Chrome:

```
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
robot --outputdir results tests/purchase_flow.robot
```

Firefox:

```
python -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
robot -v BROWSER:firefox --outputdir results tests/purchase_flow.robot
```

On Linux/macOS, activate with `source .venv/bin/activate` instead of the
`.venv\Scripts\Activate.ps1` line.

Results open in `results/report.html` and `results/log.html`. On a failure,
Selenium saves a screenshot in `results/`.

Headless (no window):

```
robot -v HEADLESS:true --outputdir results tests/purchase_flow.robot
```

## Login and data

Username, password and checkout details live in `resources/config.robot` and
can be overridden without editing files:

```
robot -v SAUCE_USERNAME:standard_user -v SAUCE_PASSWORD:secret_sauce tests/purchase_flow.robot
```

Defaults are the public demo credentials.
