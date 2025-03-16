const mongoose = require("mongoose");

const ProductSchema = new mongoose.Schema({
  name: String,
  price: Number,
  category: String,
  stock: Number,
  seller: { type: mongoose.Schema.Types.ObjectId, ref: "User" },
});

module.exports = mongoose.model("Product", ProductSchema);
