def handler(event, context):
    print("Cleaning data...")
    return {
        "statusCode": 200,
        "body": "Data cleaned successfully"
    }
