exports.handler = async (event) => {
    console.log("Dummy Node Lambda invoked");
    console.log("Event:", JSON.stringify(event));
  
    return {
      statusCode: 200,
      body: JSON.stringify({
        message: "Hello from dummy Node.js Lambda",
        input: event
      })
    };
  };
  