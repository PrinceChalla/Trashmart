extends Control

var terms_checked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_check_box_toggled(toggled_on):
	terms_checked = toggled_on
	


func _on_button_pressed():
	if terms_checked == true :
		get_tree().change_scene_to_file("res://login.tscn")
	


func _on_button_2_pressed():
	if terms_checked == true :
		get_tree().change_scene_to_file("res://main_menu.tscn")
	
