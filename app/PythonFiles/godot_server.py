import socket
import json
import pymongo
import sys
from pymongo import MongoClient


# VARIABLES
success = ""
# MONGO VARIABLES

cluster = MongoClient("mongodb+srv://kamsiosuachalla:Chimma1234#@firstcluster.dsfgzuj.mongodb.net/?retryWrites=true&w=majority&appName=firstcluster")
db = cluster["first_database"]
collection = db["first_collection"]
arg = sys.argv


# SAVING THE DICTIONARY

def save(dictionary,):
    global success
    list = collection.find_one({"username": dictionary["username"]})
    if list is None :
        SAVE_STATE = collection.insert_one(dictionary)
        print ("Data has been saved")
        success = "0"
    else :
        print("username already exists")
        success = "1"
def start_server():
    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Bind the socket to an address and port
    server_socket.bind(('localhost',6000 ))

    # Start listening for incoming connections (max 5 clients)
    server_socket.listen(5)
    print("Server is listening on port 6000...")

    # Accept a connection from a client
    client_socket, client_address = server_socket.accept()
    print(f"Connection from {client_address} has been established!")

    # Send data to the client
    #client_socket.sendall(b"{'Hello, Client!','m'} MEGA IS HERE ")

    # Receive data from the client
    data = client_socket.recv(1024)
    DICTIONARY = json.loads(data.decode())
    print(DICTIONARY)
    print(f"Received from client: {data}")
    print(f"Received from client: {data.decode('utf-8')}")
    save(DICTIONARY)
    client_socket.sendall(bytes(success,"utf-8"))
    print(success)
    quit()
    # Close the client and server sockets
    client_socket.close()
    server_socket.close()

if __name__ == "__main__":
    start_server()