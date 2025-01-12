import pymongo
import sys
from pymongo import MongoClient
cluster = MongoClient("mongodb+srv://kamsiosuachalla:Chimma1234#@firstcluster.dsfgzuj.mongodb.net/?retryWrites=true&w=majority&appName=firstcluster")
db = cluster["first_database"]
collection = db["first_collection"]
arg = sys.argv

#Beginning of useless code

string = '{"kamsi":"prince"}'
#End of useless code
dictionary = {}
def save(dictionary):
    collection.insert_one(dictionary)

def main():
    print(len(arg))
    items = []
    items.append(arg[7])
    items.append(arg[8])
    items.append(arg[9])
    dictionary = {"_id":arg[1],"username":arg[1],"password":arg[2],"contact":arg[3],"email_address":arg[4],"buyer":arg[5],"seller":arg[6],"items":items,"location":arg[10:]}
    save(dictionary)



if __name__ == "__main__":
    main()