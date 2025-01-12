extends Control
var NEWS = news.new()
var news_list = []
const no_news = preload("res://no_news.tscn")
const News = preload("res://news.tscn")
@onready var news_container = $MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer
var timer = false

var DIR = OS.get_executable_path().get_base_dir()
var interpreter_path = DIR.path_join("PythonFiles/venv/Scripts/python.exe")
var script_path = DIR.path_join("PythonFiles/news.py")



# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$Timer.start()
	
	if !OS.has_feature("standalone"): # if NOT exported version
		interpreter_path = ProjectSettings.globalize_path("res://PythonFiles/venv/Scripts/python.exe")
		script_path = ProjectSettings.globalize_path("res://PythonFiles/news.py")
		OS.create_process(interpreter_path,[script_path])
	else :
		OS.create_process(interpreter_path,[script_path])
		
		
	news_list = JSON.parse_string((NEWS.recieve_message()).replace("'",'"'))
	if len(news_list) == 0:
		var NONEWS=no_news.instantiate()
		news_container.add_child(NONEWS)
	else :
		var counter = 1
		for x in news_list :
			var NEWSS = News.instantiate()
			NEWSS.set_counter(counter)
			NEWSS.set_title(x["title"])
			NEWSS.set_body(x["body"])
			news_container.add_child(NEWSS)
			counter += 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer == true :
		$HTTPRequest.request("https://www.google.com")
		timer = false
		$Timer.start()
	

func _on_request_completed(result, response_code, headers, body):
	if result != 0 :
		get_tree().change_scene_to_file("res://no_internet.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	#pass # Replace with function body.


func _on_timer_timeout():
	timer = true
