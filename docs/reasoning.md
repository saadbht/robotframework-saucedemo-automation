# Notes

## Approach

Each page has its own Page Object file with its locators and actions. The
test file calls those actions, so it reads like the steps of the flow.

The test runs as one continuous flow. Each page is verified before it is used:
the first `Wait Until Element Is Visible` waits for an element that only exists
on that page, so if the previous step did not land there, the test stops. This
covers every step from login through to the confirmation page.

After login, the products are sorted by price (low to high). The selection is then
dynamic: with the cheapest first, the "2nd cheapest" is the item in slot 2, so
items are picked by position. Each item's "Add to cart" button switches to
"Remove" once added, which confirms the item was added successfully, and the
cart badge count confirms that the items reached the cart. Each item's name and price
are stored while adding, then compared and validated on the cart and overview
pages.

On the overview page, the "Item total" label reads like "Item total: $25.98", so
only the price value is parsed out. That total (before tax) is compared against
the sum of the stored item prices, so it is validated from live values, not
hardcoded. The confirmation page is verified using its success message; other
checks could be added here (the header, dispatch text, tick image, order
button), but the success message is enough for this flow.

## Configuration

Login details are stored in `config.robot` and can be overridden from the
command line or environment. The browser (Chrome or Firefox) is selected using
a single variable, and Selenium automatically manages the required driver, so it
works the same on Windows and Linux. The browser options turn off the password
manager so no pop-up appears during the run.

## Possible improvements

- All locators are full (absolute) XPaths, as the task requires. Full XPaths
  break if the page layout changes; stable locators (IDs, `data-test`, or CSS)
  would be sturdier.
- Negative cases (locked-out user, wrong password, empty checkout form) could
  be added, but the task only asks for the successful flow, so only that is
  covered.
- The cart shows a QTY column, which is 1 for each item here since one of each
  is added. If the flow ever added multiples of the same item, the quantity
  would also be stored, so the overview total could be summed as price times
  quantity and still match correctly.