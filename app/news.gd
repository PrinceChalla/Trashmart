extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_counter(no):
	$HBoxContainer/counter.text = str(no)
	
func set_title(title):
	$HBoxContainer2/Title.text = title
	
func set_body(body):
	$HBoxContainer3/Body.text = body
	
