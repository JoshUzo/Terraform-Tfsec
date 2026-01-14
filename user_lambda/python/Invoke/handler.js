exports.handler = async (event) => {
    console.log("Simple Node Lambda invoked");
    return {
      statusCode: 200,
      body: JSON.stringify({
        message: "Hello from simple Node.js Lambda",
        event: event
      })
    };
  };
  