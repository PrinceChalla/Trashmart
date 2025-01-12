class_name login_save
extends Node


var recieved_data


# What region will we be connecting to?
var connection
var connected = false


func _ready():
	 
	
	
	var ip = "127.0.0.1"
	var port = 60000
	
	connection = StreamPeerTCP.new()
	connection.connect_to_host(ip, port)
	
	# IF SAY CODE FUCK UP EX AM
	
	connection.poll()
	
	if connection.get_status() == connection.STATUS_CONNECTED:
		print("Successfully connected to the server")
		connected = true
	elif connection.get_status() == StreamPeerTCP.STATUS_CONNECTING:
		print("Trying to connect to " + ip + " : " + str(port))
	elif connection.get_status() == connection.STATUS_NONE or connection.get_status() == StreamPeerTCP.STATUS_ERROR:
		print("Error connecting to " + ip + " : " + str(port))
	send_message("HELLO FROM MEGA".to_utf8_buffer())
	
func _process( delta ):
	#send_message('ali')
	var ip = "127.0.0.1"
	var port = 6060
	
	connection.poll()

	if !connected:
		if connection.get_status() == connection.STATUS_CONNECTED:
			print("Process connected to " + ip + " : " + str(port))
			connected = true
			return
	
	if connection.get_status() == connection.STATUS_NONE or connection.get_status() == connection.STATUS_ERROR:
		print("Server disconnected?")
		connected = false
		set_process(false)
		return
	
	var available_bytes: int = connection.get_available_bytes()
	if available_bytes > 0:
		print("available bytes: ", available_bytes)
		var data: Array = connection.get_partial_data(available_bytes)
		# Check for read error.
		if data[0] != OK:
			print("Error getting data from stream: ", data[0])
		else:
			print("Got Data: ")
			print(str(data[1].get_string_from_utf8()))
			
		
			
			
			
			
#  ---------------------MAIN IMPORTANT PART OF CODE ------------------------			
			
			
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
			return  # Exit the loop after data is read
		# Optional: Implement a small delay to avoid busy-waiting too aggressively
		#yield(get_tree().create_timer(0.1), "timeout")			
			
func send_message(message):
	var ip = "127.0.0.1"
	var port = 6000
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
			
	recieve_message(connection)
			
