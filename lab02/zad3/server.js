const express = require("express");
const { MongoClient } = require("mongodb");

const Db = "mongodb://test-mongo:27017";
const client = new MongoClient(Db, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const app = express();

app.get("/", async (_, res) => {
  try {
    await client.connect();

    const stats = await client
      .db("stepikbaza")
      .collection("persons")
      .find({ id: 33 })
      .toArray();

    res.status(200).json(stats);
  } catch (error) {
    console.error("Błąd:", error);
    res.status(500).send("Wystąpił błąd");
  } finally {
    await client.close();
  }
});

app.listen(8080, () => {
  console.log("Uruchomiono na porcie 8080...");
});
