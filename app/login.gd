extends Control
@onready var username_line_edit = $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer/Username_line_edit
@onready var password_line_edit = $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer2/Password_line_edit
@onready var contact_line_edit = $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer3/Contact_line_edit
@onready var email_adress_line_edit = $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer4/Email_Adress_line_edit
@onready var synopsis_line_edit = $MarginContainer/ScrollContainer/MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/HBoxContainer6/Synopsis

var timer = false
#CLASS FOR LOGIN SAVE 
var godot_client = login_save.new()
 
# VARIABLES FOR PYTHON IN GODOT 
var PID
var process_pids := []
var err 
var output = []
var save_dict = {}
var DIR = OS.get_executable_path().get_base_dir()
var interpreter_path = DIR.path_join("PythonFiles/venv/Scripts/python.exe")
var script_path = DIR.path_join("PythonFiles/godot_server.py")


var users_in_Abia = []
var users_in_Adamawa = []
var users_in_AkwaIbom = []
var users_in_Anambra = []
var users_in_Bauchi = []
var users_in_Bayelsa = []
var users_in_Benue = []
var users_in_Borno = []
var users_in_CrossRiver = []
var users_in_Delta = []
var users_in_Ebonyi = []
var users_in_Edo = []
var users_in_Ekiti = []
var users_in_Enugu = []
var users_in_FCT_Abuja = []
var users_in_Gombe = []
var users_in_Imo = []
var users_in_Jigawa = []
var users_in_Kaduna = []
var users_in_Kano = []
var users_in_Katsina = []
var users_in_Kebbi = []
var users_in_Kogi = []
var users_in_Kwara = []
var users_in_Lagos = []
var users_in_Nasarawa = []
var users_in_Niger = []
var users_in_Ogun = []
var users_in_Ondo = []
var users_in_Osun = []
var users_in_Oyo = []
var users_in_Plateau = []
var users_in_Rivers = []
var users_in_Sokoto = []
var users_in_Taraba = []
var users_in_Yobe = []
var users_in_Zamfara = []
var users_in_overseas =[]
 
var users_of_Plastics = []
var users_of_Papers = []
var users_of_Metal_Scraps = []

var new_dict = {}
var registered_users ={}
var username = ""
var password = ""
var contact = ""
var email_address = ""
var synopsis = ""

var buyer = false
var seller = false


var location = []
var items = []


var Abia_State = false
var Adamawa = false
var Akwa_Ibom = false
var Anambra = false
var Bauchi = false
var Bayelsa = false
var Benue = false
var Borno = false
var Cross_River = false
var Delta = false
var Ebonyi = false
var Edo = false
var Ekiti = false
var Enugu = false
var FCT_Abuja = false
var Gombe = false
var Imo = false
var Jigawa = false
var Kaduna = false
var Kano = false
var Katsina = false
var Kebbi = false
var Kogi = false
var Kwara = false
var Lagos = false
var Nasarawa = false
var Niger = false
var Ogun = false
var Ondo = false
var Osun = false
var Oyo = false
var Plateau = false
var Rivers = false
var Sokoto = false
var Taraba = false
var Yobe = false
var Zamfara = false
var Overseas = false
var Plastics = false
var Paper = false
var Metal_Scraps = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)
	$Timer.start()
	# IF THE FILE HAS NOT BEEN EXPORTED THEN THESE VARIBLES WILL OVERIDE THE ONES ON TOP
	if !OS.has_feature("standalone"): # if NOT exported version
		interpreter_path = ProjectSettings.globalize_path("res://PythonFiles/venv/Scripts/python.exe")
		script_path = ProjectSettings.globalize_path("res://PythonFiles/godot_server.py")
		OS.create_process(interpreter_path,[script_path])
	else :
		OS.create_process(interpreter_path,[script_path])
	
	# RUNNING PYTHON INSTANCE
	#PID = OS.execute(interpreter_path,[script_path],output,false)
	print("this is path")
	print(OS.get_executable_path())
	
	# Replace with function body.

func kill_process():
	for pid in process_pids:
		var status_of_kill = OS.kill(PID)
		print(status_of_kill)
		print("killed process")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer == true :
		$HTTPRequest.request("https://www.google.com")
		timer = false
		$Timer.start()
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	#pass # Replace with function body.
func save():
	
	print("saved")
	print(password)
	print(registered_users)
	godot_client.send_message(str(new_dict).to_utf8_buffer())
	#process_pids.append((float(PID)))
	#kill_process()
	
	print(items)
	
	
	if godot_client.recieved_data == "0" :
		get_tree().change_scene_to_file("res://Succesful_save.tscn")
	else:
		get_tree().change_scene_to_file("res://Unsuccesful_save.tscn")
	#save_info.save(username,password,contact,email_address,buyer,seller,location,items)
	#get_tree().change_scene_to_file("res://Succesful_save.tscn")
	"""if username in registered_users.keys():
		get_tree().change_scene_to_file("res://Unsuccesful_save.tscn")
	else :
		get_tree().change_scene_to_file("res://Succesful_save.tscn")
		pass"""
	#pass
func variable_assigner():
	password = password_line_edit.text
	username = username_line_edit.text
	contact = contact_line_edit.text
	email_address = email_adress_line_edit.text
	synopsis = synopsis_line_edit.text
	
	if username in registered_users.keys():
		get_tree().change_scene_to_file("res://Unsuccesful_save.tscn")
	else :
		new_dict = {"username":username,"password":password,"contact":contact,"email_address":email_address,"buyer":buyer,"seller":seller,"location":location,"items":items,"synopsis":synopsis}
		registered_users[username] = new_dict
		
	
func _on_request_completed(result, response_code, headers, body):
	if result != 0 :
		get_tree().change_scene_to_file("res://no_internet.tscn")

func _on_start_pressed():
	
	variable_assigner()
	location_assigner()
	save()



func _on_abia_check_box_toggled(toggled_on):
	Abia_State = not Abia_State
	if Abia_State == true:	
		location.append("Abia")
	else:
		if "Abia" in location :
			location.erase("Abia")
	#pass # Replace with function body.


func _on_adamawa_check_box_toggled(toggled_on):
	Adamawa = not Adamawa
	if Adamawa == true:	
		location.append("Adamawa")
	else:
		if "Adamawa" in location :
			location.erase("Adamawa")
	#pass # Replace with function body.

func _on_akwa_ibom_check_box_toggled(toggled_on):
	Akwa_Ibom = not Akwa_Ibom
	if Akwa_Ibom == true:	
		location.append("Akwa_Ibom")
	else:
		if "Akwa_Ibom" in location :
			location.erase("Akwa_Ibom")
	#pass # Replace with function body.


func _on_anambra_check_box_toggled(toggled_on):
	Anambra = not Anambra
	if Anambra == true:	
		location.append("Anambra")
	else:
		if "Anambra" in location :
			location.erase("Anambra")
	#pass # Replace with function body.


func _on_bauchi_check_box_toggled(toggled_on):
	Bauchi = not Bauchi
	if Bauchi == true:	
		location.append("Bauchi")
	else:
		if "Bauchi" in location :
			location.erase("Bauchi")
	#pass # Replace with function body.


func _on_bayelsa_check_box_toggled(toggled_on):
	Bayelsa = not Bayelsa
	if Bayelsa == true:	
		location.append("Bayelsa")
	else:
		if "Bayelsa" in location :
			location.erase("Bayelsa")
	#pass # Replace with function body.


func _on_benue_check_box_toggled(toggled_on):
	Benue = not Benue
	if Benue == true:	
		location.append("Benue")
	else:
		if "Benue" in location :
			location.erase("Benue")
	#pass # Replace with function body.


func _on_borno_check_box_toggled(toggled_on):
	Borno = not Borno
	if Borno == true:	
		location.append("Borno")
	else:
		if "Borno" in location :
			location.erase("Borno")
	#pass # Replace with function body.


func _on_cross_river_check_box_toggled(toggled_on):
	Cross_River = not Cross_River
	if Cross_River == true:	
		location.append("Cross River")
	else:
		if "Cross River" in location :
			location.erase("Cross River")
	#pass # Replace with function body.


func _on_delta_check_box_toggled(toggled_on):
	Delta = not Delta
	if Delta == true:	
		location.append("Delta")
	else:
		if "Delta" in location :
			location.erase("Delta")
	#pass # Replace with function body.


func _on_ebonyi_check_box_toggled(toggled_on):
	Ebonyi = not Ebonyi
	if Ebonyi == true:	
		location.append("Ebonyi")
	else:
		if "Ebonyi" in location :
			location.erase("Ebonyi")
	#pass # Replace with function body.


func _on_edo_check_box_toggled(toggled_on):
	Edo = not Edo
	if Edo == true:	
		location.append("Edo")
	else:
		if "Edo" in location :
			location.erase("Edo")
	#pass # Replace with function body.


func _on_ekiti_check_box_toggled(toggled_on):
	Ekiti = not Ekiti
	if Ekiti == true:	
		location.append("Ekiti")
	else:
		if "Ekiti" in location :
			location.erase("Ekiti")
	#pass # Replace with function body.


func _on_enugu_check_box_toggled(toggled_on):
	Enugu = not Enugu
	if Enugu == true:	
		location.append("Enugu")
	else:
		if "Enugu" in location :
			location.erase("Enugu")
	#pass # Replace with function body.


func _on_fct_abuja_check_box_toggled(toggled_on):
	FCT_Abuja = not FCT_Abuja
	if FCT_Abuja == true:	
		location.append("FCT Abuja")
	else:
		if "FCT Abuja" in location :
			location.erase("FCT Abuja")
	#pass # Replace with function body.


func _on_gombe_check_box_toggled(toggled_on):
	Gombe = not Gombe
	if Gombe == true:	
		location.append("Gombe")
	else:
		if "Gombe" in location :
			location.erase("Gombe")
	#pass # Replace with function body.

func _on_imo_check_box_toggled(toggled_on):
	Imo = not Imo
	if Imo == true:	
		location.append("Imo")
	else:
		if "Imo" in location :
			location.erase("Imo")
	#pass # Replace with function body.


func _on_jigawa_check_box_toggled(toggled_on):
	Jigawa = not Jigawa
	if Jigawa == true:	
		location.append("Jigawa")
	else:
		if "Jigawa" in location :
			location.erase("Jigawa")
	#pass # Replace with function body.

func _on_kaduna_check_box_toggled(toggled_on):
	Kaduna = not Kaduna
	if Kaduna == true:	
		location.append("Kaduna")
	else:
		if "Kaduna" in location :
			location.erase("Kaduna")
	#pass # Replace with function body.


func _on_kano_check_box_toggled(toggled_on):
	Kano = not Kano
	if Kano == true:	
		location.append("Kano")
	else:
		if "Kano" in location :
			location.erase("Kano")
	#pass # Replace with function body.


func _on_katsina_check_box_toggled(toggled_on):
	Katsina = not Katsina
	if Katsina == true:	
		location.append("Katsina")
	else:
		if "Katsina" in location :
			location.erase('Katsina')
	#pass # Replace with function body.


func _on_kebbi_check_box_toggled(toggled_on):
	Kebbi = not Kebbi
	if Kebbi == true:	
		location.append("Kebbi")
	else:
		if "Kebbi" in location :
			location.erase("Kebbi")
	#pass # Replace with function body..

func _on_kogi_check_box_toggled(toggled_on):
	Kogi = not Kogi
	if Kogi == true:	
		location.append("Kogi")
	else:
		if "Kogi" in location :
			location.erase("Kogi")
	#pass # Replace with function body.


func _on_kwara_check_box_toggled(toggled_on):
	Kwara = not Kwara
	if Kwara == true:	
		location.append("Kwara")
	else:
		if "Kwara" in location :
			location.erase("Kwara")
	#pass # Replace with function body.


func _on_lagos_check_box_toggled(toggled_on):
	Lagos = not Lagos
	if Lagos == true:	
		location.append("Lagos")
	else:
		if "Lagos" in location :
			location.erase("Lagos")
	#pass # Replace with function body..


func _on_nasarawa_check_box_toggled(toggled_on):
	Nasarawa = not Nasarawa
	if Nasarawa == true:	
		location.append("Nasarawa")
	else:
		if "Nasarawa" in location :
			location.erase("Nasarawa")
	#pass # Replace with function body.


func _on_niger_check_box_toggled(toggled_on):
	Niger = not Niger
	if Niger == true:	
		location.append("Niger")
	else:
		if "Niger" in location :
			location.erase("Niger")
	#pass # Replace with function body.


func _on_ogun_check_box_toggled(toggled_on):
	Ogun = not Ogun
	if Ogun == true:	
		location.append("Ogun")
	else:
		if "Ogun" in location :
			location.erase("Ogun")
	#pass # Replace with function body.


func _on_ondo_check_box_toggled(toggled_on):
	Ondo = not Ondo
	if Ondo == true:	
		location.append("Ondo")
	else:
		if "Ondo" in location :
			location.erase("Ondo")
	#pass # Replace with function body.


func _on_osun_check_box_toggled(toggled_on):
	Osun = not Osun
	if Osun == true:	
		location.append("Osun")
	else:
		if "Osun" in location :
			location.erase("Osun")
	#pass # Replace with function body.

func _on_oyo_check_box_toggled(toggled_on):
	Oyo = not Oyo
	if Oyo == true:	
		location.append("Oyo")
	else:
		if "Oyo" in location :
			location.erase("Oyo")
	#pass # Replace with function body.


func _on_plateau_check_box_toggled(toggled_on):
	Plateau = not Plateau
	if Plateau == true:	
		location.append("Plateau")
	else:
		if "Plateau" in location :
			location.erase("Plateau")
	#pass # Replace with function body.


func _on_rivers_check_box_toggled(toggled_on):
	Rivers = not Rivers
	if Rivers == true:	
		location.append("Rivers")
	else:
		if "Rivers" in location :
			location.erase("Rivers")
	#pass # Replace with function body.


func _on_sokoto_check_box_toggled(toggled_on):
	Sokoto = not Sokoto
	if Sokoto == true:	
		location.append("Sokoto")
	else:
		if "Sokoto" in location :
			location.erase("Sokoto")
	#pass # Replace with function body.


func _on_taraba_check_box_toggled(toggled_on):
	Taraba = not Taraba
	if Taraba == true:	
		location.append("Taraba")
	else:
		if "Taraba" in location :
			location.erase("Taraba")
	#pass # Replace with function body.

func _on_yobe_check_box_toggled(toggled_on):
	Yobe = not Yobe
	if Yobe == true:	
		location.append("Yobe")
	else:
		if "Yobe" in location :
			location.erase("Yobe")
	#pass # Replace with function body.


func _on_zamfara_check_box_toggled(toggled_on):
	Zamfara = not Zamfara
	if Zamfara == true:	
		location.append("Zamfara")
	else:
		if "Zamfara" in location :
			location.erase("Zamfara")
	#pass # Replace with function body.


func _on_overseas_check_box_toggled(toggled_on):
	Overseas = not Overseas
	if Overseas == true:	
		location.append("Overseas")
	else:
		if "Overseas" in location :
			location.erase('Overseas')
	#pass # Replace with function body.


# Items come here




func _on_plastics_check_box_toggled(toggled_on):
	Plastics = not Plastics
	if Plastics == true:	
		items.append("Plastics")
	else:
		if "Plastics" in items :
			items.erase("Plastics")
	#pass # Replace with function body.


func _on_paper_check_box_toggled(toggled_on):
	Paper = not Paper
	if Paper == true:	
		items.append("Paper")
	else:
		if "Paper" in items :
			items.erase("Paper")
	#pass # Replace with function body.


func _on_metal_scraps_check_box_toggled(toggled_on):
	Metal_Scraps = not Metal_Scraps
	if Metal_Scraps == true:	
		items.append("Metal Scraps")
	else:
		if "Metal Scraps" in items :
			items.erase("Metal Scraps")
	#pass # Replace with function body.



func _on_buyer_check_box_toggled(toggled_on):
	buyer = not buyer
	#pass # Replace with function body.


func _on_seller_check_box_toggled(toggled_on):
	seller = not seller
	#pass # Replace with function body.




func location_assigner():
	if Abia_State == true :
		users_in_Abia.append(username)
	else :
		if username in users_in_Abia :
			users_in_Abia.erase(username)
			
	if Adamawa == true :
		users_in_Adamawa.append(username)
	else :
		if username in users_in_Adamawa :
			users_in_Adamawa.erase(username)
			
	if Akwa_Ibom == true :
		users_in_AkwaIbom.append(username)
	else :
		if username in users_in_AkwaIbom :
			users_in_AkwaIbom.erase(username)
			
	if Anambra == true :
		users_in_Anambra.append(username)
	else :
		if username in users_in_Anambra :
			users_in_Anambra.erase(username)
			
	if Bauchi == true :
		users_in_Bauchi.append(username)
	else :
		if username in users_in_Bauchi :
			users_in_Bauchi.erase(username)
			
	if Bayelsa == true :
		users_in_Bayelsa.append(username)
	else :
		if username in users_in_Bayelsa :
			users_in_Bayelsa.erase(username)
			
	if Benue == true :
		users_in_Benue.append(username)
	else :
		if username in users_in_Benue :
			users_in_Benue.erase(username)
			
	if Borno == true :
		users_in_Borno.append(username)
	else :
		if username in users_in_Borno :
			users_in_Borno.erase(username)
			
	if Cross_River == true :
		users_in_CrossRiver.append(username)
	else :
		if username in users_in_CrossRiver :
			users_in_CrossRiver.erase(username)
			
	if Delta == true :
		users_in_Delta.append(username)
	else :
		if username in users_in_Delta :
			users_in_Delta.erase(username)
			
	if Ebonyi == true :
		users_in_Ebonyi.append(username)
	else :
		if username in users_in_Ebonyi :
			users_in_Ebonyi.erase(username)
			
	if Edo == true :
		users_in_Edo.append(username)
	else :
		if username in users_in_Edo :
			users_in_Edo.erase(username)
			
	if Ekiti == true :
		users_in_Ekiti.append(username)
	else :
		if username in users_in_Ekiti :
			users_in_Ekiti.erase(username)
			
	if Enugu == true :
		users_in_Enugu.append(username)
	else :
		if username in users_in_Enugu :
			users_in_Enugu.erase(username)
			
	if FCT_Abuja == true :
		users_in_FCT_Abuja.append(username)
	else :
		if username in users_in_FCT_Abuja :
			users_in_FCT_Abuja.erase(username)
			
	if Gombe == true :
		users_in_Gombe.append(username)
	else :
		if username in users_in_Gombe :
			users_in_Gombe.erase(username)
			
	if Imo == true :
		users_in_Imo.append(username)
	else :
		if username in users_in_Imo :
			users_in_Imo.erase(username)
			
	if Jigawa == true :
		users_in_Jigawa.append(username)
	else :
		if username in users_in_Jigawa :
			users_in_Jigawa.erase(username)
			
	if Kaduna == true :
		users_in_Kaduna.append(username)
	else :
		if username in users_in_Kaduna :
			users_in_Kaduna.erase(username)
			
	if Kano == true :
		users_in_Kano.append(username)
	else :
		if username in users_in_Kano :
			users_in_Kano.erase(username)
			
	if Katsina == true :
		users_in_Katsina.append(username)
	else :
		if username in users_in_Katsina :
			users_in_Katsina.erase(username)
			
	if Kebbi == true :
		users_in_Kebbi.append(username)
	else :
		if username in users_in_Kebbi :
			users_in_Kebbi.erase(username)
			
	if Kogi == true :
		users_in_Kogi.append(username)
	else :
		if username in users_in_Kogi :
			users_in_Kogi.erase(username)
			
	if Kwara == true :
		users_in_Kwara.append(username)
	else :
		if username in users_in_Kwara :
			users_in_Kwara.erase(username)
			
	if Lagos == true :
		users_in_Lagos.append(username)
	else :
		if username in users_in_Lagos :
			users_in_Lagos.erase(username)
			
	if Nasarawa == true :
		users_in_Nasarawa.append(username)
	else :
		if username in users_in_Nasarawa :
			users_in_Nasarawa.erase(username)
			
	if Niger == true :
		users_in_Niger.append(username)
	else :
		if username in users_in_Niger :
			users_in_Niger.erase(username)
			
	if Ogun == true :
		users_in_Ogun.append(username)
	else :
		if username in users_in_Ogun :
			users_in_Ogun.erase(username)
			
	if Ondo == true :
		users_in_Ondo.append(username)
	else :
		if username in users_in_Ondo :
			users_in_Ondo.erase(username)
			
	if Osun == true :
		users_in_Osun.append(username)
	else :
		if username in users_in_Osun :
			users_in_Osun.erase(username)
			
	if Oyo == true :
		users_in_Oyo.append(username)
	else :
		if username in users_in_Oyo :
			users_in_Oyo.erase(username)
			
	if Plateau == true :
		users_in_Plateau.append(username)
	else :
		if username in users_in_Plateau :
			users_in_Plateau.erase(username)
			
	if Rivers == true :
		users_in_Rivers.append(username)
	else :
		if username in users_in_Rivers :
			users_in_Rivers.erase(username)
			
	if Sokoto == true :
		users_in_Sokoto.append(username)
	else :
		if username in users_in_Sokoto :
			users_in_Sokoto.erase(username)
			
	if Taraba == true :
		users_in_Taraba.append(username)
	else :
		if username in users_in_Taraba :
			users_in_Taraba.erase(username)
			
	if Yobe == true :
		users_in_Yobe.append(username)
	else :
		if username in users_in_Yobe :
			users_in_Yobe.erase(username)
			
	if Zamfara == true :
		users_in_Zamfara.append(username)
	else :
		if username in users_in_Zamfara :
			users_in_Zamfara.erase(username)
			
	if Overseas == true :
		users_in_overseas.append(username)
	else :
		if username in users_in_overseas :
			users_in_overseas.erase(username)
			
			
			
	if Plastics == true :
		users_of_Plastics.append(username)
	else :
		if username in users_of_Plastics :
			users_of_Plastics.erase(username)
			
	if Paper == true :
		users_of_Papers.append(username)
	else :
		if username in users_of_Papers :
			users_of_Papers.erase(username)
			
	if Metal_Scraps == true :
		users_of_Metal_Scraps.append(username)
	else :
		if username in users_of_Metal_Scraps :
			users_of_Metal_Scraps.erase(username)


func _on_timer_timeout():
	timer = true
