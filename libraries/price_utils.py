"""Helper function for reading and adding up prices shown on the site."""

import re


def parse_price(text):
    """Get the number out of a price string, e.g. "$9.99" -> 9.99."""
    match = re.search(r"(\d+(?:\.\d+)?)", str(text))
    if match is None:
        raise ValueError("No price number found in: %r" % text)
    return float(match.group(1))


def sum_prices(*prices):
    """Add prices and round to 2 decimals (avoids float rounding tails)."""
    return round(sum(float(p) for p in prices), 2)
