extends Control

var login_scene = preload("res://login.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_pressed():
	#get_tree().change_scene_to_file("res://login.tscn")
	get_tree().change_scene_to_packed(login_scene)
	#pass # Replace with function body.


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	#pass # Replace with function body.
