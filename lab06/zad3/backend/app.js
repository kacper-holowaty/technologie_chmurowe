const express = require("express");
const { MongoClient } = require("mongodb");

const Db = process.env.MONGO_URI || "mongodb://database:27017/";
const client = new MongoClient(Db, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const app = express();
const PORT = 5000;

app.get("/", async (req, res) => {
  res.send(
    "Witaj na serwerze Express Intercity Premium do stacji Warszawa Centralna, przez stacje: Gdańsk Wrzeszcz, Gdańsk Główny, Tczew, Malbork, Iława Główna, Warszawa Zachodnia."
  );
});

app.get("/chlopy", async (req, res) => {
  try {
    await client.connect();

    const stats = await client
      .db("stepikbaza")
      .collection("users")
      .find({ gender: "male" })
      .toArray();

    res.status(200).json(stats);
  } catch (error) {
    console.error("Błąd:", error);
    res.status(500).send("Wystąpił błąd");
  } finally {
    await client.close();
  }
});

app.get("/baby", async (req, res) => {
  try {
    await client.connect();

    const stats = await client
      .db("stepikbaza")
      .collection("users")
      .find({ gender: "female" })
      .toArray();

    res.status(200).json(stats);
  } catch (error) {
    console.error("Błąd:", error);
    res.status(500).send("Wystąpił błąd");
  } finally {
    await client.close();
  }
});

app.listen(PORT, () => {
  console.log(`Serwer express dziła na porcie ${PORT}...`);
});
