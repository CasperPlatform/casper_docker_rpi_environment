from pymongo import MongoClient
client = MongoClient('localhost', 10080)
db = client.test_database