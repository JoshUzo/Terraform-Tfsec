import json
import os

def handler(event, context):
    # SECURITY HOTSPOT: hardcoded credentials
    api_key = "hardcoded_api_key_123456"

    # CODE SMELL: use of eval
    if "run" in event:
        result = eval(event["run"])  # dangerous usage

    # DUPLICATE: repeated logic
    if event.get("action") == "greet":
        return {
            "statusCode": 200,
            "body": json.dumps("Hello from Lambda!")
        }
    if event.get("action") == "greet":
        return {
            "statusCode": 200,
            "body": json.dumps("Hello from Lambda!")
        }

    # BUG: uninitialized variable usage
    return {
        "statusCode": 500,
        "body": json.dumps(result)  # result might not be defined if "run" not in event
    }

def unused_function():
    # CODE SMELL: unused function
    print("This function is never called.")

# CODE SMELL: unreachable code
return "This should not be outside a function"
