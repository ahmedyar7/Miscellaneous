import mysql.connector
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv(".env")

DATABASE_HOST = os.getenv("DATABASE_HOST", "localhost")
DATABASE_USER = os.getenv("DATABASE_USER", "root")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
DATABASE_NAME = os.getenv("DATABASE_NAME", "yourdatabase")


class DataBaseConnection:
    def __init__(self):
        pass

    # Establish connection
    def connect_db(self):
        try:
            conn = mysql.connector.connect(
                host=DATABASE_HOST,
                user=DATABASE_USER,
                password=DATABASE_PASSWORD,
                database=DATABASE_NAME,
            )

            if conn.is_connected():
                print("✅ Connected to MySQL database")

            cursor = conn.cursor()

            # Create the students table if not exists
            cursor.execute(
                """
                CREATE TABLE IF NOT EXISTS students (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    name VARCHAR(100),
                    age INT,
                    grade VARCHAR(10)
                )
                """
            )
            print("✅ Table created successfully!")

            return conn, cursor

        except mysql.connector.Error as e:
            print(f"❌ Error: {e}")
            return None, None

    # Task 4: Fetch and display all student records
    def fetch_students(self, cursor):
        cursor.execute("SELECT * FROM students")
        records = cursor.fetchall()

        print("\n📌 Student Records:")
        print("-" * 40)
        for record in records:
            print(
                f"ID: {record[0]}, Name: {record[1]}, Age: {record[2]}, Grade: {record[3]}"
            )
        print("-" * 40)

    # Task 5: Update student age based on ID
    def update_student_age(self, cursor, conn):
        student_id = int(input("Enter Student ID to update age: "))
        new_age = int(input("Enter new age: "))

        cursor.execute(
            "UPDATE students SET age = %s WHERE id = %s", (new_age, student_id)
        )
        conn.commit()

        print(f"✅ Student ID {student_id} updated successfully!")

    # Task 6: Delete student record based on ID
    def delete_student(self, cursor, conn):
        student_id = int(input("Enter Student ID to delete: "))

        cursor.execute("DELETE FROM students WHERE id = %s", (student_id,))
        conn.commit()

        print(f"✅ Student ID {student_id} deleted successfully!")

    # Bonus Task: Insert student data dynamically from user input
    def insert_student(self, cursor, conn):
        name = input("Enter student name: ")
        age = int(input("Enter student age: "))
        grade = input("Enter student grade: ")

        cursor.execute(
            "INSERT INTO students (name, age, grade) VALUES (%s, %s, %s)",
            (name, age, grade),
        )
        conn.commit()

        print("✅ Student record inserted successfully!")
