from database_connection import DataBaseConnection


# Main function to run the script
def main():

    dbconnect = DataBaseConnection()
    conn, cursor = dbconnect.connect_db()

    if not conn:
        return

    while True:
        print("\n📌 Choose an option:")
        print("1. Insert a new student")
        print("2. Fetch all students")
        print("3. Update student age")
        print("4. Delete a student")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            dbconnect.insert_student(cursor, conn)
        elif choice == "2":
            dbconnect.fetch_students(cursor)
        elif choice == "3":
            dbconnect.update_student_age(cursor, conn)
        elif choice == "4":
            dbconnect.delete_student(cursor, conn)
        elif choice == "5":
            print("✅ Exiting the program.")
            break
        else:
            print("❌ Invalid choice. Please try again.")

    cursor.close()
    conn.close()


if __name__ == "__main__":
    main()
