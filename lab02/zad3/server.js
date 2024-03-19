const express = require("express");
const { MongoClient } = require("mongodb");

const Db = "mongodb://localhost:27017";
const client = new MongoClient(Db, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const app = express();

app.get("/", async (_, res) => {
  await client.connect();

  const stats = await client
    .db("mcdonalds")
    .collection("products")
    .find({})
    .toArray();
  res.status(200).json(stats);

  client.close();
});

app.listen(8080, () => {
  console.log("Uruchomiono na porcie 8080...");
});
