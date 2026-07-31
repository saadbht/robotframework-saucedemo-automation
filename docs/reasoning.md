# Notes

## Approach

Each page has its own page object file with its locators and actions. The
test file calls those actions, so it reads like the steps of the flow.

Item selection is dynamic. After sorting low to high, the cheapest item is
first, so "2nd cheapest" is the item in slot 2. I pick by position. I read
each item's name when adding it and re-check and validate it in the cart, and I read the
live prices to validte the total, so nothing is hardcoded.

Login details sit in `config.robot` and can be overridden from the command
line or environment. Chrome & Firefox is a single variable, and Selenium
pulls the right driver on its own, so it works the same on Windows and Linux.
Every action waits with `Wait Until Element Is Visible` to avoid flaky timing.
The browser options turn off the password manager so no such popup during the run.

## Possible improvements

- All locators are full (absolute) XPaths, as the task requires. Full XPaths
  break if the page layout changes; stable locators (IDs, `data-test`, or CSS)
  would be sturdier.
- Negative cases (locked-out user, wrong password, empty checkout form) could
  be added, but the task only asks for the successful flow, so only that is
  covered.
