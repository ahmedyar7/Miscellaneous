## 📌 MySQL Student Database Management

A simple **Python-based MySQL database management system** for handling student records. The script allows users to **insert, update, delete, and fetch student records** dynamically through a menu-driven interface.

### 🚀 Features

- ✅ **Insert new students** (name, age, grade)
- ✅ **Fetch all student records** in a formatted display
- ✅ **Update a student's age** using their ID
- ✅ **Delete a student** by ID
- ✅ **User-friendly menu-driven interface**

### 📂 Setup Instructions

1. Install MySQL and create a database (e.g., `students_db`).
2. Install required dependencies:
   ```sh
   pip install mysql-connector-python python-dotenv
   ```
3. Create a `.env` file with database credentials:
   ```
   DATABASE_HOST=localhost
   DATABASE_USER=root
   DATABASE_PASSWORD=yourpassword
   DATABASE_NAME=your_db_name
   ```
4. Run the script:
   ```bash
   python main.py
   ```

### 🛠️ Technologies Used

- **Python**
- **MySQL**
- **MySQL Connector**
- **dotenv** (for environment variables)
