from pymongo import MongoClient
import datetime
client = MongoClient('localhost', 10080)
db = client.test_database

post = {"author": "Mike",
       "text": "My first blog post!",
       "tags": ["mongodb", "python", "pymongo"],
       "date": datetime.datetime.utcnow()}
posts = db.posts
post_id = posts.insert_one(post).inserted_id
print post_id
print posts.find_one()       