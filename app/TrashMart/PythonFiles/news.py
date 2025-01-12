import socket
import pymongo
import sys
from pymongo import MongoClient
import json
# VARIABLES
success = []
# MONGO VARIABLES

cluster = MongoClient("mongodb+srv://kamsiosuachalla:Chimma1234#@firstcluster.dsfgzuj.mongodb.net/?retryWrites=true&w=majority&appName=firstcluster")
db = cluster["first_database"]
collection = db["correspondence"]
arg = sys.argv


# SAVING THE DICTIONARY

def search():
    return collection.find({},{"_id":0})
def start_server():
    # Create a socket object
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # Bind the socket to an address and port
    server_socket.bind(('localhost',8000 ))

    # Start listening for incoming connections (max 5 clients)
    server_socket.listen(5)
    print("Server is listening on port 8000...")

    # Accept a connection from a client
    client_socket, client_address = server_socket.accept()
    print(f"Connection from {client_address} has been established!")

    # Send data to the client
    #client_socket.sendall(b"{'Hello, Client!','m'} MEGA IS HERE ")
    search_result = (search())
    for x in search_result :
        success.append(x)
    client_socket.sendall(bytes(((json.dumps(success))),"utf-8"))
    print(success)

    # Close the client and server sockets
    client_socket.close()
    server_socket.close()

if __name__ == "__main__":
    start_server()