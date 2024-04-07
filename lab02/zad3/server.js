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
      .toArray(); // Dodano toArray() aby przekształcić wyniki do tablicy

    res.status(200).json(stats); // Zwrócono wyniki do klienta HTTP

    //client.close(); // Ten kod musi być przeniesiony z tego miejsca, patrz uwaga poniżej.
  } catch (error) {
    console.error("Błąd:", error);
    res.status(500).send("Wystąpił błąd"); // W przypadku błędu zwracamy status 500
  } finally {
    await client.close(); // Zamykamy połączenie z bazą danych
  }
});

// app.get("/", async (_, res) => {
//   await client.connect();

//   const stats = await client
//     .db("stepikbaza")
//     .collection("persons")
//     .find({ id: 33 });
//   res.status(200).json(stats);

//   client.close();
// });

app.listen(8080, () => {
  console.log("Uruchomiono na porcie 8080...");
});
