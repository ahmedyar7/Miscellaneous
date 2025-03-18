import mongoose from "mongoose";

const dbConnect = async () => {
  try {
    mongoose.connect(process.env.MONOGODB_URL);
    console.log("Monogo db is connected");
  } catch (error) {
    console.log(`Mongo Db connection error: ${error}`);
  }
};

export default dbConnect;
