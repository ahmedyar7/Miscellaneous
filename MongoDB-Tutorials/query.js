const { MongoClient } = require("mongodb");

const uri = "mongodb://localhost:27017";
const client = new MongoClient(uri);

async function connectToDb() {
  if (!client.isConnected) await client.connect();
  return client;
}

async function showDatabases() {
  await connectToDb();
  const databases = await client.db().admin().listDatabases();
  return databases.databases.map((db) => db.name);
}

async function insertOne(dbName, collectionName, document) {
  await connectToDb();
  const result = await client
    .db(dbName)
    .collection(collectionName)
    .insertOne(document);
  return result.insertedId;
}

async function insertMany(dbName, collectionName, documents) {
  await connectToDb();
  const result = await client
    .db(dbName)
    .collection(collectionName)
    .insertMany(documents);
  return result.insertedIds;
}

async function deleteMany(dbName, collectionName) {
  await connectToDb();
  const result = await client
    .db(dbName)
    .collection(collectionName)
    .deleteMany({});
  return result.deletedCount;
}

async function findAll(dbName, collectionName) {
  await connectToDb();
  return await client.db(dbName).collection(collectionName).find().toArray();
}

async function findWithConditions(dbName, collectionName, query) {
  await connectToDb();
  return await client
    .db(dbName)
    .collection(collectionName)
    .find(query)
    .toArray();
}

async function findIn(dbName, collectionName, field, values) {
  await connectToDb();
  const query = { [field]: { $in: values } };
  return await client
    .db(dbName)
    .collection(collectionName)
    .find(query)
    .toArray();
}

async function findWithAnd(dbName, collectionName, conditions) {
  await connectToDb();
  const query = { $and: conditions };
  return await client
    .db(dbName)
    .collection(collectionName)
    .find(query)
    .toArray();
}

async function findWithOr(dbName, collectionName, conditions) {
  await connectToDb();
  const query = { $or: conditions };
  return await client
    .db(dbName)
    .collection(collectionName)
    .find(query)
    .toArray();
}

async function updateOne(dbName, collectionName, filter, update) {
  await connectToDb();
  const result = await client
    .db(dbName)
    .collection(collectionName)
    .updateOne(filter, update);
  return result.modifiedCount;
}

async function updateMany(dbName, collectionName, filter, update) {
  await connectToDb();
  const result = await client
    .db(dbName)
    .collection(collectionName)
    .updateMany(filter, update);
  return result.modifiedCount;
}

async function findWithLimit(dbName, collectionName, limitValue) {
  await connectToDb();
  return await client
    .db(dbName)
    .collection(collectionName)
    .find()
    .limit(limitValue)
    .toArray();
}

async function findWithSort(
  dbName,
  collectionName,
  sortField,
  ascending = true
) {
  await connectToDb();
  const order = ascending ? 1 : -1;
  return await client
    .db(dbName)
    .collection(collectionName)
    .find()
    .sort({ [sortField]: order })
    .toArray();
}

async function main() {
  const dbName = "companyDB";
  const collection = "managers";

  console.log("Databases:", await showDatabases());

  const newManager = { name: "Ahmed", age: 19, role: "Backend-Programmer" };
  const id1 = await insertOne(dbName, collection, newManager);
  console.log("Inserted One:", id1);

  const managers = [
    { name: "Ahmed Yar", age: 23, department: "HR" },
    { name: "Zainab", age: 18, department: "ICS" },
    { name: "Ayaan Hassan Khan", age: 21, department: "Computer Science" },
    { name: "Hamza Sajid", age: 23, department: "Backend-Software Testing" },
  ];
  const ids = await insertMany(dbName, collection, managers);
  console.log("Inserted Many:", ids);

  const all = await findAll(dbName, collection);
  console.log("All Managers:", all);

  const zainab = await findWithConditions(dbName, collection, {
    name: "Zainab",
  });
  console.log("Zainab:", zainab);

  const orQuery = await findWithOr(dbName, collection, [
    { department: "ICS" },
    { name: "Ahmed" },
  ]);
  console.log("OR Query:", orQuery);

  const updatedCount = await updateOne(
    dbName,
    collection,
    { name: "Zainab" },
    { $set: { age: 19 } }
  );
  console.log("Updated One:", updatedCount);

  const updatedMany = await updateMany(
    dbName,
    collection,
    { department: "HR" },
    { $set: { age: 25 } }
  );
  console.log("Updated Many:", updatedMany);

  const deleted = await deleteMany(dbName, collection);
  console.log("Deleted:", deleted);
}

main()
  .then(() => client.close())
  .catch(console.error);
