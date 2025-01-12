extends Control
@onready var recycling_centres_near_you_button = $MarginContainer/VBoxContainer/HBoxContainer/recycling_centres_near_you_button
@onready var buyers_list_button = $MarginContainer/VBoxContainer/HBoxContainer/Buyers_list_button
@onready var sellers_list_button = $MarginContainer/VBoxContainer/HBoxContainer/Sellers_list_button
@onready var main_menu_button = $MarginContainer2/VBoxContainer/HBoxContainer/main_menu_button
@onready var recycling_centres_near_you =preload("res://recycling_centres_near_you.tscn") as PackedScene
@onready var sellers_list = preload("res://sellers_list.tscn")as PackedScene
@onready var buyers_list = preload('res://buyers_list.tscn')as PackedScene
#@onready var main_menu = preload("res://main_menu.tscn")as PackedScene
var timer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$Timer.start()
	buyers_list_button.button_down.connect(buyers_list_button_pressed)
	recycling_centres_near_you_button.button_down.connect(recycling_centres_near_you_button_pressed)
	sellers_list_button.button_down.connect(sellers_list_button_pressed)
	#main_menu_button.button_down.connect(main_menu_button_pressed)
	#pass # Replace with function body.

func buyers_list_button_pressed():
	get_tree().change_scene_to_packed(buyers_list)
func recycling_centres_near_you_button_pressed():
	get_tree().change_scene_to_packed(recycling_centres_near_you)
func sellers_list_button_pressed():
	
	get_tree().change_scene_to_file("res://trashy.tscn")
func main_menu_button_pressed():
	pass
	#get_tree().change_scene_to_packed(main_menu)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer == true :
		$HTTPRequest.request("https://www.google.com")
		timer = false
		$Timer.start()
	

func _on_request_completed(result, response_code, headers, body):
	if result != 0 :
		get_tree().change_scene_to_file("res://no_internet.tscn")



func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	pass # Replace with function body.


func _on_timer_timeout():
	timer = true
