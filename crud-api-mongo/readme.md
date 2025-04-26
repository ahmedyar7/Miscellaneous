# CRUD Mongo API 🛠️

This project demonstrates how to create a simple **CRUD API** using **MongoDB** with both **Python (Flask)** and **JavaScript (Node.js/Express)**.

---

## 🛠️ Requirements

- Python 3.8+
- Node.js 18+
- MongoDB Atlas or Local MongoDB Server

---

## 🐍 Python Implementation (Flask + PyMongo)

**Setup:**

1. Install dependencies:

   ```bash
   pip install Flask flask-pymongo python-dotenv
   ```

2. Create a `.env` file:

   ```dotenv
   MONGO_URI=your_mongodb_connection_string
   ```

3. Run the server:
   ```bash
   python app.py
   ```

---

**Endpoints:**

| Method |      Endpoint       |    Description    |
| :----: | :-----------------: | :---------------: |
|  GET   |      `/todos`       |  Fetch all todos  |
|  POST  |   `/create-todos`   | Create a new todo |
|  GET   |    `/<todo_id>`     | Get a single todo |
| PATCH  |    `/<todo_id>`     |   Update a todo   |
| DELETE | `/delete/<todo_id>` |   Delete a todo   |

---

---

## JavaScript Implementation (Node.js + Express + Mongoose)

**Setup:**

1. Install dependencies:

   ```bash
   npm install express mongoose dotenv
   ```

2. Create a `.env` file:

   ```dotenv
   MONGO_URI=your_mongodb_connection_string
   ```

3. Run the server:
   ```bash
   node server.js
   ```

---

**Endpoints:**

| Method |    Endpoint     |    Description    |
| :----: | :-------------: | :---------------: |
|  GET   |    `/todos`     |  Fetch all todos  |
|  POST  | `/create-todos` | Create a new todo |
|  GET   |  `/todos/:id`   | Get a single todo |
| PATCH  |  `/todos/:id`   |   Update a todo   |
| DELETE |  `/todos/:id`   |   Delete a todo   |

---

## 📚 Project Structure

```
crud-api-mongo/
│
├── python-implementation/
│   ├── app.py
│   ├── crud.py
│   ├── .env
│
├── javascript-implementation/
│   ├── server.js
│   ├── package-lock.json
│   ├── package.json
│
├───database
│       db.js
│
├───models
│       todo.model.js
│
└── README.md
```
