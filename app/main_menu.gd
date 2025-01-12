extends Control
@onready var my_account_button = $"MarginContainer2/VBoxContainer/HBoxContainer/My account" as Button
@onready var donate_button = $MarginContainer2/VBoxContainer/HBoxContainer/Donate as Button
@onready var correspondence_button = $MarginContainer/HBoxContainer/VBoxContainer/Correspondence as Button
@onready var trash_mart_button = $"MarginContainer/HBoxContainer/VBoxContainer/Trash Mart" as Button
@onready var correspondence  = preload("res://correspondence.tscn") as PackedScene
@onready var trash_mart  = preload("res://trash_mart.tscn") as PackedScene
@onready var donate  = preload("res://donate.tscn") as PackedScene
@onready var login  = preload("res://login.tscn") as PackedScene

var timer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$Timer.start()
	
	correspondence_button.button_down.connect(on_correspondence_pressed)
	trash_mart_button.button_down.connect(on_trash_mart_pressed)
	my_account_button.button_down.connect(on_my_account_pressed)
	donate_button.button_down.connect(on_donate_pressed)
	#pass # Replace with function body.

func on_correspondence_pressed():
	get_tree().change_scene_to_packed(correspondence)
func on_trash_mart_pressed():
	get_tree().change_scene_to_packed(trash_mart)
func on_my_account_pressed():
	get_tree().change_scene_to_packed(login)
func on_donate_pressed():
	get_tree().change_scene_to_packed(donate)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer == true :
		$HTTPRequest.request("https://www.google.com")
		timer = false
		$Timer.start()
	

func _on_request_completed(result, response_code, headers, body):
	if result != 0 :
		get_tree().change_scene_to_file("res://no_internet.tscn")


func _on_timer_timeout():
	timer = true
