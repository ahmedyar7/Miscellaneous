import Register from "../controller/Auth.js";
import express from "express";

const AuthRoutes = express.Router();

// Registering the user
AuthRoutes.post("/register", Register);

export default AuthRoutes;
