class_name news
extends Node
var recieved_data
var running = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func recieve_message():
	var ip = "127.0.0.1"
	var port = 8000
	var connection = StreamPeerTCP.new()
	connection.connect_to_host(ip, port)
	connection.poll()
	while running == true :
		var available_bytes = connection.get_available_bytes()
		if available_bytes > 0:
			print("available bytes: ", available_bytes)
			var data = connection.get_partial_data(available_bytes)
			print("Received data: ", data)
			self.recieved_data = str((data[1].get_string_from_utf8()))
			print("this is status")
			print(self.recieved_data)
			print(JSON.parse_string((recieved_data.replace("'",'"'))))
			return recieved_data
	if running == false :
		return []
func time_up():
	running = false
