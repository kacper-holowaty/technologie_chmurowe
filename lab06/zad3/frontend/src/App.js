import React, { useState } from "react";
import axios from "axios";

const BackendEndpoint = "http://backend:5000"; // Adres backendu (uwzględniający nazwę kontenera)

const Przyciski = () => {
  const [boysData, setBoysData] = useState([]);
  const [girlsData, setGirlsData] = useState([]);

  const fetchData = async (gender) => {
    const end = gender === "male" ? "chlopy" : "baby";

    try {
      const response = await axios.get(`${BackendEndpoint}/data/${end}`);
      if (gender === "male") {
        setBoysData(response.data);
      } else if (gender === "female") {
        setGirlsData(response.data);
      }
    } catch (error) {
      console.error("Błąd podczas pobierania danych:", error);
    }
  };

  return (
    <div>
      <button onClick={() => fetchData("male")}>Chłopy</button>
      <button onClick={() => fetchData("female")}>Baby</button>
      <div>
        <h2>Chłopy:</h2>
        <ul>
          {boysData.map((boy, index) => (
            <li key={index}>{boy}</li>
          ))}
        </ul>
      </div>
      <div>
        <h2>Baby:</h2>
        <ul>
          {girlsData.map((girl, index) => (
            <li key={index}>{girl}</li>
          ))}
        </ul>
      </div>
    </div>
  );
};

function App() {
  return <Przyciski />;
}

export default App;
