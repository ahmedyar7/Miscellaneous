import userModel from "../models/User.js";

async function Register(req, res) {
  try {
    const { userName, email, password } = req.body;

    if (!userName || !email || !password) {
      return res
        .status(303)
        .json({ success: true, message: "All feilds are required" });
    }

    const ExistUser = await userModel.findOne({ email });

    if (ExistUser) {
      return res
        .status(402)
        .json({ success: false, message: "User already exists please login" });
    }

    const newUser = new userModel({
      userName,
      email,
      password,
    });

    await newUser.save();
    return res.status(200).json({
      success: true,
      message: "User register successfully",
      user: newUser,
    });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ sucess: false, message: "Internal Server error" });
  }
}

export default { Register };
