extends Control

const no_results = preload("res://no_results.tscn")
const search_items = preload("res://scroll.tscn")
@onready var search_results = $MarginContainer/MarginContainer/ScrollContainer/Search_results

# Called when the node enters the scene tree for the first time.
func _ready():
	print(GlobalVariable.results_from_search)
	if GlobalVariable.results_from_search.size() == 0 :
		var NoResponse = no_results.instantiate()
		search_results.add_child(NoResponse)
	else:
		var SearchItems = search_items.instantiate()
		var counter = 1
		for x in GlobalVariable.results_from_search :
			SearchItems = search_items.instantiate()
			SearchItems.set_counter(counter)
			print(GlobalVariable.results_from_search)
			print(x)
			SearchItems.set_username(x["username"])
			SearchItems.set_contact(x["contact"])
			SearchItems.set_email(x["email_address"])
			SearchItems.set_synopsis(x["synopsis"])
			SearchItems.set_buyer(x["buyer"])
			SearchItems.set_seller(x["seller"])
			counter += 1
			search_results.add_child(SearchItems)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://buyers_list.tscn")
	pass # Replace with function body.
