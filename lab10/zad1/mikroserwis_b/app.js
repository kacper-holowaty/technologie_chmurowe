const express = require("express");
const app = express();

app.get("/endpoint", (req, res) => {
  res.send("Witam z Mikroserwisu B!");
});

app.listen(4000, () => {
  console.log(`Mikroserwis B nasłuchuje na porcie 4000`);
});
