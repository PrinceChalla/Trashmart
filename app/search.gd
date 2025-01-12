extends Node
class_name search
var recieved_data
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func recieve_message(connection):
	while true:
		var available_bytes = connection.get_available_bytes()
		if available_bytes > 0:
			print("available bytes: ", available_bytes)
			var data = connection.get_partial_data(available_bytes)
			print("Received data: ", data)
			self.recieved_data = str((data[1].get_string_from_utf8()))
			print("this is status")
			print(self.recieved_data)
			return recieved_data
		# Optional: Implement a small delay to avoid busy-waiting too aggressively
		#yield(get_tree().create_timer(0.1), "timeout")			
			
func send_message(message):
	var ip = "127.0.0.1"
	var port = 7000
	var connection = StreamPeerTCP.new()
	connection.connect_to_host(ip, port)
	connection.poll()
	if connection.get_status() == connection.STATUS_CONNECTED:
		#connection.put_utf8_string(message)
		connection.put_data(message)
		#connection.flush() # Ensure data is sent immediately
		print("Sent message: ", message)
	else:
		print("Not connected to server. Cannot send message.")	
			
	return recieve_message(connection)
			
