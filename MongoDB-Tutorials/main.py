from pymongo import MongoClient


def connect_to_db():
    return MongoClient("mongodb://localhost:27017/")


def show_databases(client):
    return client.list_database_names()


def insert_one(db_name, collection_name, document):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    result = collection.insert_one(document)
    return result.inserted_id


def insert_many(db_name, collection_name, documents):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    result = collection.insert_many(documents)
    return result.inserted_ids


def delete_many(db_name, collection_name):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    result = collection.delete_many({})
    return result.deleted_count


def find_all(db_name, collection_name):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    return list(collection.find())


def find_with_conditions(db_name, collection_name, query):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    return list(collection.find(query))


def find_in(db_name, collection_name, field, values):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    query = {field: {"$in": values}}
    return list(collection.find(query))


def find_with_and(db_name, collection_name, conditions):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    query = {"$and": conditions}
    return list(collection.find(query))


def find_with_or(db_name, collection_name, conditions):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    query = {"$or": conditions}
    return list(collection.find(query))


def update_one(db_name, collection_name, filter, update):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    result = collection.update_one(filter, update)
    return result.modified_count


def update_many(db_name, collection_name, filter, update):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    result = collection.update_many(filter, update)
    return result.modified_count


def find_with_limit(db_name, collection_name, limit_value):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    return list(collection.find().limit(limit_value))


def find_with_sort(db_name, collection_name, sort_field, ascending=True):
    client = connect_to_db()
    db = client[db_name]
    collection = db[collection_name]
    order = 1 if ascending else -1
    return list(collection.find().sort(sort_field, order))


if __name__ == "__main__":
    client = connect_to_db()
    print("Databases:", show_databases(client))

    new_manager = {"name": "Ahmed", "age": 19, "role": "Backend-Programmer"}
    insert_id = insert_one("companyDB", "managers", new_manager)
    print(f"Inserted document with ID: {insert_id}")

    managers = [
        {"name": "Ahmed Yar", "age": 23, "department": "HR"},
        {"name": "Zainab", "age": 18, "department": "ICS"},
        {"name": "Ayaan Hassan Khan", "age": 21, "department": "Computer Science"},
        {"name": "Hamza Sajid", "age": 23, "department": "Backend-Software Testing"},
    ]
    insert_ids = insert_many("companyDB", "managers", managers)
    print(f"Inserted documents with IDs: {insert_ids}")

    all_managers = find_all("companyDB", "managers")
    print("All Managers:", all_managers)

    manager_zainab = find_with_conditions("companyDB", "managers", {"name": "Zainab"})
    print("Manager Zainab:", manager_zainab)

    condition_or = find_with_or(
        "companyDB", "managers", [{"department": "ICS"}, {"name": "Ahmed"}]
    )
    print("Managers with ICS department or name Ahmed:", condition_or)

    deleted_count = delete_many("companyDB", "managers")
    print(f"Deleted {deleted_count} documents from 'managers'.")

    updated_count = update_one(
        "companyDB", "managers", {"name": "Zainab"}, {"$set": {"age": 19}}
    )
    print(f"Updated {updated_count} document.")

    updated_many_count = update_many(
        "companyDB", "managers", {"department": "HR"}, {"$set": {"age": 25}}
    )
    print(f"Updated {updated_many_count} documents.")
