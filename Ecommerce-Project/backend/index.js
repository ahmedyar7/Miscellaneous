// Creating the Server
import express from "express";
import dotenv from "dotenv";
import dbConnect from "./libs/db.js";
import AuthRoutes from "./routes/Auth.js";

dotenv.config();
const PORT = process.env.PORT || 4000;

const app = express();
dbConnect();

app.use("/auth", AuthRoutes);

app.get("/", (req, res) => {
  res.send("Hello from backend");
});

app.listen(PORT, () => {
  console.log(`app is running on Port Number: ${PORT}`);
});
