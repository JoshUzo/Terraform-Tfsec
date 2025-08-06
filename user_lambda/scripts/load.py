def handler(event, context):
    print("Loading data to destination...")
    return {
        "statusCode": 200,
        "body": "Data loaded successfully"
    }
