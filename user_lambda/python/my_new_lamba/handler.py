import json
import os

def lambda_handler(event, context):
    """
    Dummy Lambda function.
    Simply echoes back the incoming event with an added message.
    """
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Hello from my_new_lambda!",
            "stage": os.environ.get("STAGE", "unknown"),
            "input_event": event
        })
    }
