extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_counter(no: int):
	$HBoxContainer8/counter.text = str(no)

func set_username(name:String):
	$HBoxContainer/Username.text = name
	
func set_contact(contact: String):
	$HBoxContainer2/Contact.text = contact
	
func set_email(email : String):
	$HBoxContainer3/Email.text = email
	
func set_synopsis(synopsis: String):
	$HBoxContainer5/Synopsis.text = synopsis
	
func set_buyer(buyer: bool):
	$HBoxContainer6/Buyer.text = str(buyer)
	
func set_seller(seller: bool):
	$HBoxContainer7/Seller.text = str(seller)
