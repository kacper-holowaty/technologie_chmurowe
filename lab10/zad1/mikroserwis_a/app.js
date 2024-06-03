const express = require("express");
const axios = require("axios");
const app = express();

app.get("/", (req, res) => {
  res.send("Gratulacje użytkowniku, udało Ci sięuruchomić aplikację!");
});

app.get("/api", async (req, res) => {
  try {
    const response = await axios.get(
      "http://mikroserwis-b-service:4000/endpoint"
    );
    res.send(response.data);
  } catch (error) {
    res.status(500).send(error.toString());
  }
});

app.listen(3000, () => {
  console.log(`Mikroserwis A nasłuchuje na porcie 3000`);
});
