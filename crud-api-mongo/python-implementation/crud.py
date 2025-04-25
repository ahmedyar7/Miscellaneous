from flask import Flask, jsonify, request
from flask_pymongo import PyMongo
from bson import ObjectId
from dotenv import load_dotenv
import os

# loadeing the Environment variables from the .env file
load_dotenv()

app = Flask(__name__)
app.config["MONGO_URI"] = os.getenv("MONGO_URI")
mongo = PyMongo(app)


class Crud:
    def __init__(self):
        self.todos = mongo.db.todos

    # GET all todos
    @app.route("/todos", methods=["GET"])
    def get_all_todos(self):
        try:
            todo_list = list(todos.find())
            for todos in todo_list:
                todos["_id"] = str(todos["_id"])

            return jsonify(
                success=True, message="Todos fetched successfully", data=todo_list
            )

        except Exception as e:
            return jsonify(success=False, message="Todos Failed to fetched", data=None)

    # POST a new todo
    @app.route("/create-todos", methods=["POST"])
    def post_todo(self):
        try:

            todo_details = request.json
            inserted_id = todo_details.insert_one(todo_details).inserted_id
            new_todo = self.todos.find_one({"_id": ObjectId(inserted_id)})
            new_todo["_id"] = str(new_todo["_id"])

            return jsonify(
                success=True, message="Todos fetched successfully", data=new_todo
            )

        except Exception as e:
            return jsonify(success=False, message="Todos Failed to fetched", data=None)
