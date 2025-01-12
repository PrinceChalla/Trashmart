extends Control
var location = []
var items = []
var query = {}
var buyer = false
var seller = false
var searching = search.new()
var timer = false

# PYTHON RELATED STUFFS

var DIR = OS.get_executable_path().get_base_dir()
var interpreter_path = DIR.path_join("PythonFiles/venv/Scripts/python.exe")
var script_path = DIR.path_join("PythonFiles/search.py")

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$Timer.start()
	# IF THE FILE HAS NOT BEEN EXPORTED THEN THESE VARIBLES WILL OVERIDE THE ONES ON TOP
	if !OS.has_feature("standalone"): # if NOT exported version
		interpreter_path = ProjectSettings.globalize_path("res://PythonFiles/venv/Scripts/python.exe")
		script_path = ProjectSettings.globalize_path("res://PythonFiles/search.py")
		OS.create_process(interpreter_path,[script_path])
	else :
		OS.create_process(interpreter_path,[script_path])
	
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


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://trash_mart.tscn")
	#pass # Replace with function body.


func _on_abia_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Abia")
	else:
		if "Abia" in location :
			location.erase("Abia")
	pass # Replace with function body.


func _on_adamawa_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Adamawa")
	else:
		if "Adamawa" in location :
			location.erase("Adamawa")
	pass # Replace with function body.


func _on_akwa_ibom_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Akwa_Ibom")
	else:
		if "Akwa_Ibom" in location :
			location.erase("Akwa_Ibom")
	pass # Replace with function body.


func _on_anambra_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Anambra")
	else:
		if "Anambra" in location :
			location.erase("Anambra")
	pass # Replace with function body.


func _on_bauchi_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Bauchi")
	else:
		if "Bauchi" in location :
			location.erase("Bauchi")
	pass # Replace with function body.


func _on_bayelsa_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Bayelsa")
	else:
		if "Bayelsa" in location :
			location.erase("Bayelsa")
	pass # Replace with function body.


func _on_benue_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Benue")
	else:
		if "Benue" in location :
			location.erase("Benue")
	pass # Replace with function body.


func _on_borno_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Borno")
	else:
		if "Borno" in location :
			location.erase("Borno")
	pass # Replace with function body.


func _on_cross_river_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Cross River")
	else:
		if "Cross River" in location :
			location.erase("Cross River")
	pass # Replace with function body.


func _on_delta_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Delta")
	else:
		if "Delta" in location :
			location.erase("Delta")
	pass # Replace with function body.


func _on_ebonyi_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Ebonyi")
	else:
		if "Ebonyi" in location :
			location.erase("Ebonyi")
	pass # Replace with function body.


func _on_edo_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Edo")
	else:
		if "Edo" in location :
			location.erase("Edo")
	pass # Replace with function body.


func _on_ekiti_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Ekiti")
	else:
		if "Ekiti" in location :
			location.erase("Ekiti")
	pass # Replace with function body.


func _on_enugu_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Enugu")
	else:
		if "Enugu" in location :
			location.erase("Enugu")
	pass # Replace with function body.


func _on_fct_abuja_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("FCT Abuja")
	else:
		if "FCT Abuja" in location :
			location.erase("FCT Abuja")
	pass # Replace with function body.


func _on_gombe_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Gombe")
	else:
		if "Gombe" in location :
			location.erase("Gombe")
	pass # Replace with function body.


func _on_imo_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Imo")
	else:
		if "Imo" in location :
			location.erase("Imo")
	pass # Replace with function body.


func _on_jigawa_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Jigawa")
	else:
		if "Jigawa" in location :
			location.erase("Jigawa")
	pass # Replace with function body.


func _on_kaduna_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Kaduna")
	else:
		if "Kaduna" in location :
			location.erase("Kaduna")
	pass # Replace with function body.


func _on_kano_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Kano")
	else:
		if "Kano" in location :
			location.erase("Kano")
	pass # Replace with function body.


func _on_katsina_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Katsina")
	else:
		if "Katsina" in location :
			location.erase('Katsina')
	pass # Replace with function body.


func _on_kebbi_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Kebbi")
	else:
		if "Kebbi" in location :
			location.erase("Kebbi")
	pass # Replace with function body.


func _on_kogi_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Kogi")
	else:
		if "Kogi" in location :
			location.erase("Kogi")
	pass # Replace with function body.


func _on_kwara_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Kwara")
	else:
		if "Kwara" in location :
			location.erase("Kwara")
	pass # Replace with function body.


func _on_lagos_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Lagos")
	else:
		if "Lagos" in location :
			location.erase("Lagos")
	pass # Replace with function body.


func _on_nasarawa_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Nasarawa")
	else:
		if "Nasarawa" in location :
			location.erase("Nasarawa")
	pass # Replace with function body.


func _on_niger_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Niger")
	else:
		if "Niger" in location :
			location.erase("Niger")
	pass # Replace with function body.


func _on_ogun_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Ogun")
	else:
		if "Ogun" in location :
			location.erase("Ogun")
	pass # Replace with function body.


func _on_ondo_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Ondo")
	else:
		if "Ondo" in location :
			location.erase("Ondo")
	pass # Replace with function body.


func _on_osun_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Osun")
	else:
		if "Osun" in location :
			location.erase("Osun")
	pass # Replace with function body.


func _on_oyo_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Oyo")
	else:
		if "Oyo" in location :
			location.erase("Oyo")	
	pass # Replace with function body.


func _on_plateau_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Plateau")
	else:
		if "Plateau" in location :
			location.erase("Plateau")
	pass # Replace with function body.


func _on_rivers_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Rivers")
	else:
		if "Rivers" in location :
			location.erase("Rivers")
	pass # Replace with function body.


func _on_sokoto_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Sokoto")
	else:
		if "Sokoto" in location :
			location.erase("Sokoto")
	pass # Replace with function body.


func _on_taraba_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Taraba")
	else:
		if "Taraba" in location :
			location.erase("Taraba")
	pass # Replace with function body.


func _on_yobe_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Yobe")
	else:
		if "Yobe" in location :
			location.erase("Yobe")
	pass # Replace with function body.


func _on_zamfara_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Zamfara")
	else:
		if "Zamfara" in location :
			location.erase("Zamfara")
	pass # Replace with function body.


func _on_overseas_check_box_toggled(toggled_on):
	if toggled_on == true:	
		location.append("Overseas")
	else:
		if "Overseas" in location :
			location.erase('Overseas')
	pass # Replace with function body.


func _on_plastics_check_box_toggled(toggled_on):
	if toggled_on == true:	
		items.append("Plastics")
	else:
		if "Plastics" in items :
			items.erase("Plastics")
	pass # Replace with function body.


func _on_paper_check_box_toggled(toggled_on):
	if toggled_on == true:	
		items.append("Paper")
	else:
		if "Paper" in items :
			items.erase("Paper")
	pass # Replace with function body.


func _on_metal_scraps_check_box_toggled(toggled_on):
	if toggled_on == true:	
		items.append("Metal Scraps")
	else:
		if "Metal Scraps" in items :
			items.erase("Metal Scraps")
	pass # Replace with function body.



func variable_assigner():
	query = {"location":location,"items":items,"buyer":buyer,"seller":seller}


	#searching.send_message(query)
	pass # Replace with function body.


func _on_buyer_check_box_toggled(toggled_on):
	if toggled_on == true :
		buyer = true
	else:
		buyer = false
	pass # Replace with function body.


func _on_seller_check_box_toggled(toggled_on):
	if toggled_on == true :
		seller = true
	else:
		seller = false
	pass # Replace with function body.


func _on_search_button_pressed():
	
	variable_assigner()
	print(query)
	print(GlobalVariable.results_from_search)
	GlobalVariable.results_from_search = JSON.parse_string((searching.send_message(str(query).to_utf8_buffer())).replace("'",'"'))
	print(GlobalVariable.results_from_search)
	get_tree().change_scene_to_file("res://search.tscn")
	pass # Replace with function body.


func _on_timer_timeout():
	timer = true
