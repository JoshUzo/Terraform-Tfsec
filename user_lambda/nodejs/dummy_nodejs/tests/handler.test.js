const { handler } = require('../handler');

(async () => {
  const response = await handler({ test: "event" });

  if (response.statusCode !== 200) {
    throw new Error("Expected statusCode 200");
  }

  console.log("Test passed");
})();
