from cleaner_utils import remove_nulls, normalize_keys, safe_cast

def handler(event, context):
    raw_data = {
        "First Name": "Alice",
        "Age": "30",
        "Email": None,
        "EmptyList": ["first", "seventh"],
        "EmptyDict": {"help":"value6"},
    }

    clean_data = remove_nulls(raw_data)
    normalized = normalize_keys(clean_data)

    age = safe_cast(normalized.get("age"), int, default=0)

    return {
        "clean_data": normalized,
        "parsed_age": age
    }
