const express = require("express");
const app = express();

const zmienna = process.env.MY_VARIABLE;

app.get("/", (req, res) => {
  res.send(`${zmienna}!`);
});

app.listen(3000, () => {
  console.log("Uruchomiono na porcie 3000...");
});
