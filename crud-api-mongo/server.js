import express from "express";
import dotenv from "dotenv";
import connectToDb from "./database/db.js";
import { Todo } from "./models/todo.model.js";

dotenv.config();
const port = process.env.port || 4000;

const app = express();

// Middleware
app.use(express.json());

// Connect to MongoDB
connectToDb();

// GET all todos
app.get("/todos", async (req, res) => {
  try {
    const result = await Todo.find();
    res.send({
      success: true,
      message: "Todo List retrieved successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    res.send({
      success: false,
      message: "Failed to retrieve Todo List",
      data: null,
    });
  }
});

// CREATE
app.post("/create-todos", async (req, res) => {
  const todoDetails = req.body;

  try {
    const result = await Todo.create(todoDetails);
    res.send({
      success: true,
      message: "Todo created successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    res.send({
      success: false,
      message: "Failed to create todo",
      data: null,
    });
  }
});

//  READ
app.get("/:todoId", async (req, res) => {
  const todoId = req.params.todoId;
  try {
    const result = await Todo.findById(todoId);

    res.send({
      success: true,
      message: "Todo is retrived successfully",
      data: result,
    });
  } catch (error) {
    console.error(error);
    res.send({
      success: false,
      message: "Failed to retrieve todo",
      data: null,
    });
  }
});

// UPDATE
app.patch("/:todoId", async (req, res) => {
  const todoId = req.params.todoId;
  const updatedTodo = req.body;

  try {
    const result = await Todo.findByIdAndUpdate(todoId, updatedTodo, {
      new: true,
    });

    res.send({
      success: true,
      message: "Todo is Updated successfully",
      data: result,
    });
  } catch (error) {
    res.send({
      success: false,
      message: "Failed to update Todo",
      data: result,
    });
  }
});

// DELETE
app.delete("/delete/:todoId", async (req, res) => {
  try {
    const deletedTodo = await Todo.findByIdAndDelete(req.params.todoId);

    if (!deletedTodo) {
      return res.status(404).send({
        success: false,
        message: "Todo not found",
        data: null,
      });
    }

    res.send({
      success: true,
      message: "The Todo was deleted successfully",
      data: deletedTodo,
    });
  } catch (error) {
    console.error(error);
    res.send({
      success: false,
      message: "Failed to delete the Todo",
      data: null,
    });
  }
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
