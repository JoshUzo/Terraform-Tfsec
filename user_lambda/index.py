from my_util import greet

def handler(event, context):
    return {
        "statusCode": 200,
        "body": greet("Lambda with Layer & S3 Trigger")
    }
