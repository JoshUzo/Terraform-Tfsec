# cleaner_utils.py

def remove_nulls(data):
    """Remove keys with null or empty values from a dictionary."""
    if not isinstance(data, dict):
        raise ValueError("Input must be a dictionary.")

    return {k: v for k, v in data.items() if v not in [None, "", [], {}]}


def normalize_keys(data):
    """Lowercase and underscore keys in a dictionary."""
    if not isinstance(data, dict):
        raise ValueError("Input must be a dictionary.")

    return {k.lower().replace(" ", "_"): v for k, v in data.items()}


def safe_cast(value, to_type, default=None):
    """Safely cast a value to a type, return default on failure."""
    try:
        return to_type(value)
    except (ValueError, TypeError):
        return default
