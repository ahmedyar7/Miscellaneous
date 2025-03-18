// Creating the Server
import express from "express";
import dotenv from "dotenv";
import dbConnect from "./libs/db.js";

dotenv.config();
const PORT = process.env.PORT || 4000;

const app = express();
dbConnect();

app.use(/auth/Router)
app.get("/", (request, response) => {
  response.send("Hello from backend");
});

app.listen(PORT, () => {
  console.log(`app is running on Port Number: ${PORT}`);
});
