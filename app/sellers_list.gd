extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

	#pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://trash_mart.tscn")
	#pass # Replace with function body.


func _on_abia_check_box_toggled(toggled_on):
	pass # Replace with function body.
