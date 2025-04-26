from flask import Flask, jsonify, request
from flask_pymongo import PyMongo
from bson import ObjectId
from dotenv import load_dotenv
from pymongo import ReturnDocument
import os

load_dotenv()

app = Flask(__name__)
app.config["MONGO_URI"] = os.getenv("MONGO_URI")
mongo = PyMongo(app)
todos = mongo.db.todos


@app.route("/todos", methods=["GET"])
def get_all_todos():
    try:
        todo_list = list(todos.find())
        for todo in todo_list:
            todo["_id"] = str(todo["_id"])

        return jsonify(
            success=True, message="Todos fetched successfully", data=todo_list
        )
    except Exception as e:
        print(e)
        return jsonify(success=False, message="Todos failed to fetch", data=None)


@app.route("/create-todos", methods=["POST"])
def post_todo():
    try:
        todo_details = request.json
        inserted_id = todos.insert_one(todo_details).inserted_id
        new_todo = todos.find_one({"_id": ObjectId(inserted_id)})
        new_todo["_id"] = str(new_todo["_id"])

        return jsonify(success=True, message="Todo created successfully", data=new_todo)
    except Exception as e:
        print(e)
        return jsonify(success=False, message="Todo failed to create", data=None)


@app.route("/<todo_id>", methods=["GET"])
def get_todo(todo_id):
    try:
        todo = todos.find_one({"_id": ObjectId(todo_id)})
        if todo:
            todo["_id"] = str(todo["_id"])
            return jsonify(
                success=True, message="Todo retrieved successfully", data=todo
            )
        else:
            return jsonify(success=False, message="Todo not found", data=None)
    except Exception as e:
        print(e)
        return jsonify(success=False, message="Failed to retrieve Todo", data=None)


@app.route("/<todo_id>", methods=["PATCH"])
def update_todo(todo_id):
    try:
        updated_data = request.json
        result = todos.find_one_and_update(
            {"_id": ObjectId(todo_id)},
            {"$set": updated_data},
            return_document=ReturnDocument.AFTER,
        )

        if result:
            result["_id"] = str(result["_id"])
            return jsonify(
                success=True, message="Todo updated successfully", data=result
            )
        else:
            return jsonify(success=False, message="Todo not found", data=None)
    except Exception as e:
        print(e)
        return jsonify(success=False, message="Failed to update Todo", data=None)


@app.route("/delete/<todo_id>", methods=["DELETE"])
def delete_todo(todo_id):
    try:
        result = todos.find_one_and_delete({"_id": ObjectId(todo_id)})

        if result:
            result["_id"] = str(result["_id"])
            return jsonify(
                success=True, message="Todo deleted successfully", data=result
            )
        else:
            return jsonify(success=False, message="Todo not found", data=None)
    except Exception as e:
        print(e)
        return jsonify(success=False, message="Failed to delete the Todo", data=None)
