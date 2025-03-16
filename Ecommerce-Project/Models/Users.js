const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  username: String,
  password: String,
  role: { type: String, enum: ["admin", "seller"], default: "seller" },
});

module.exports = mongoose.model("User", UserSchema);
