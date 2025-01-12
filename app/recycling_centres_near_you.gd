extends Control


const abia = preload("res://abia_sate_recycling_centres.tscn")
const  adamawa = preload("res://adamawa_state_recycling_centres.tscn")
const  akwaibom = preload("res://akwaibom_sate_recycling_centres.tscn")
const anambra = preload("res://anambra_sate_recycling_centres.tscn")
const bauchi = preload("res://bauchi_sate_recycling_centres.tscn")
const bayelsa = preload("res://bayelsa_sate_recycling_centres.tscn")
const benue = preload("res://benue_sate_recycling_centres.tscn")
const borno = preload("res://borno_sate_recycling_centres.tscn")
const crossriver = preload("res://crossriver_state_recycling_centres.tscn")
const delta = preload("res://delta_state_recycling_centres.tscn")
const ebonyi = preload("res://ebonyi_sate_recycling_centres.tscn")
const edo = preload("res://edo_sate_recycling_centres.tscn")
const ekiti = preload("res://ekiti_sate_recycling_centres.tscn")
const enugu = preload("res://enugu_sate_recycling_centres.tscn")
const gombe = preload("res://gombe_sate_recycling_centres.tscn")
const imo = preload("res://imo_sate_recycling_centres.tscn")
const jigawa = preload("res://jigawa_sate_recycling_centres.tscn")
const abuja = preload("res://abuja_sate_recycling_centres.tscn")
const kaduna = preload("res://kaduna_sate_recycling_centres.tscn")
const kano = preload("res://kano_sate_recycling_centres.tscn")
const katsina = preload("res://katsina_sate_recycling_centres.tscn")
const kebbi = preload("res://kebbi_sate_recycling_centres.tscn")
const kogi =preload("res://kogi_sate_recycling_centres.tscn")
const kwara = preload("res://kwara_sate_recycling_centres.tscn")
const lagos = preload("res://lagos_sate_recycling_centres.tscn")
const nassarawa = preload("res://nassarawa_sate_recycling_centres.tscn")
const niger = preload("res://niger_sate_recycling_centres.tscn")
const ogun = preload("res://ogun_sate_recycling_centres.tscn")
const ondo = preload("res://ondo_sate_recycling_centres.tscn")
const osun = preload("res://osun_sate_recycling_centres.tscn")
const oyo = preload("res://oyo_sate_recycling_centres.tscn")
const plateau = preload("res://plateau_sate_recycling_centres.tscn")
const rivers = preload("res://rivers_sate_recycling_centres.tscn")
const sokoto = preload("res://sokoto_sate_recycling_centres.tscn")
const taraba = preload("res://taraba_sate_recycling_centres.tscn")
const yobe = preload("res://yobe_sate_recycling_centres.tscn")
const  zamfara = preload("res://zamfara_sate_recycling_centres.tscn")
const overseas = preload("res://overseas_sate_recycling_centres.tscn")
@onready var recycling_stations = $"MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer/TabContainer/Recycling centres/MarginContainer/ScrollContainer/Recycling_centres"

var ABIA
var ADAMAWA
var ANAMBRA
var AKWAIBOM
var BAUCHI
var BAYELSA
var BENUE
var BORNO
var CROSSRIVER
var DELTA
var EBONYI
var EDO
var EKITI
var ENUGU
var GOMBE
var IMO
var JIGAWA
var ABUJA
var KADUNA
var KANO
var KATSINA
var KEBBI
var KWARA
var KOGI
var NASSARAWA
var NIGER
var LAGOS
var OGUN
var OSUN
var ONDO
var OYO
var PLATEAU
var RIVERS
var SOKOTO
var TARABA
var YOBE
var ZAMFARA
var OVERSEAS
# Called when the node enters the scene tree for the first time.
func _ready():
	ABIA = abia.instantiate()
	ADAMAWA = adamawa.instantiate()
	AKWAIBOM = akwaibom.instantiate()
	ANAMBRA = anambra.instantiate()
	BAUCHI = bauchi.instantiate()
	BAYELSA = bayelsa.instantiate()
	BENUE = benue.instantiate()
	BORNO = borno.instantiate()
	DELTA =delta.instantiate()
	CROSSRIVER = crossriver.instantiate()
	EBONYI = ebonyi.instantiate()
	EDO = edo.instantiate()
	EKITI = ekiti.instantiate()
	ENUGU = enugu.instantiate()
	GOMBE = gombe.instantiate()
	IMO = imo.instantiate()
	JIGAWA = jigawa.instantiate()
	ABUJA = abuja.instantiate()
	KADUNA = kaduna.instantiate()
	KANO = kano.instantiate()
	KATSINA = katsina.instantiate()
	KEBBI = kebbi.instantiate()
	KWARA = kwara.instantiate()
	KOGI = kogi.instantiate()	
	LAGOS = lagos.instantiate()
	NASSARAWA = nassarawa.instantiate()
	NIGER = niger.instantiate()
	OGUN = ogun.instantiate()
	OSUN = osun.instantiate()
	ONDO = ondo.instantiate()
	OYO = oyo.instantiate()
	PLATEAU = plateau.instantiate()
	RIVERS = rivers.instantiate()
	SOKOTO = sokoto.instantiate()
	TARABA = taraba.instantiate()
	YOBE = yobe.instantiate()
	ZAMFARA = zamfara.instantiate()
	OVERSEAS = overseas.instantiate()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://trash_mart.tscn")
	#pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	#pass # Replace with function body.


func _on_abia_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ABIA)
	else :
		recycling_stations.remove_child(ABIA)
	pass # Replace with function body.


func _on_adamawa_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ADAMAWA)
	else :
		recycling_stations.remove_child(ADAMAWA)
	pass # Replace with function body.


func _on_akwa_ibom_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(AKWAIBOM)
	else :
		recycling_stations.remove_child(AKWAIBOM)
	pass # Replace with function body.


func _on_anambra_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ANAMBRA)
	else :
		recycling_stations.remove_child(ANAMBRA)
	pass # Replace with function body.


func _on_bauchi_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(BAUCHI)
	else :
		recycling_stations.remove_child(BAUCHI)


func _on_bayelsa_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(BAYELSA)
	else :
		recycling_stations.remove_child(BAYELSA)


func _on_benue_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(BENUE)
	else :
		recycling_stations.remove_child(BENUE)

func _on_borno_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(BORNO)
	else :
		recycling_stations.remove_child(BORNO)


func _on_cross_river_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(CROSSRIVER)
	else :
		recycling_stations.remove_child(CROSSRIVER)


func _on_delta_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(DELTA)
	else :
		recycling_stations.remove_child(DELTA)



func _on_ebonyi_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(EBONYI)
	else :
		recycling_stations.remove_child(EBONYI)


func _on_edo_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(EDO)
	else :
		recycling_stations.remove_child(EDO)

func _on_ekiti_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(EKITI)
	else :
		recycling_stations.remove_child(EKITI)


func _on_enugu_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ENUGU)
	else :
		recycling_stations.remove_child(ENUGU)


func _on_gombe_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(GOMBE)
	else :
		recycling_stations.remove_child(GOMBE)


func _on_imo_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(IMO)
	else :
		recycling_stations.remove_child(IMO)


func _on_jigawa_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(JIGAWA)
	else :
		recycling_stations.remove_child(JIGAWA)


func _on_fct_abuja_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ABUJA)
	else :
		recycling_stations.remove_child(ABUJA)


func _on_kaduna_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(KADUNA)
	else :
		recycling_stations.remove_child(KADUNA)

func _on_kano_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(KANO)
	else :
		recycling_stations.remove_child(KANO)


func _on_katsina_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(KATSINA)
	else :
		recycling_stations.remove_child(KATSINA)


func _on_kebbi_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(KEBBI)
	else :
		recycling_stations.remove_child(KEBBI)


func _on_kogi_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(KOGI)
	else :
		recycling_stations.remove_child(KOGI)


func _on_kwara_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(KWARA)
	else :
		recycling_stations.remove_child(KWARA)


func _on_lagos_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(LAGOS)
	else :
		recycling_stations.remove_child(LAGOS)


func _on_nasarawa_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(NASSARAWA)
	else :
		recycling_stations.remove_child(NASSARAWA)

func _on_niger_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(NIGER)
	else :
		recycling_stations.remove_child(NIGER)


func _on_ogun_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(OGUN)
	else :
		recycling_stations.remove_child(OGUN)

func _on_ondo_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ONDO)
	else :
		recycling_stations.remove_child(ONDO)


func _on_osun_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(OSUN)
	else :
		recycling_stations.remove_child(OSUN)


func _on_oyo_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(OYO)
	else :
		recycling_stations.remove_child(OYO)


func _on_plateau_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(PLATEAU)
	else :
		recycling_stations.remove_child(PLATEAU)


func _on_rivers_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(RIVERS)
	else :
		recycling_stations.remove_child(RIVERS)


func _on_sokoto_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(SOKOTO)
	else :
		recycling_stations.remove_child(SOKOTO)


func _on_taraba_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(TARABA)
	else :
		recycling_stations.remove_child(TARABA)


func _on_yobe_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(YOBE)
	else :
		recycling_stations.remove_child(YOBE)


func _on_zamfara_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(ZAMFARA)
	else :
		recycling_stations.remove_child(ZAMFARA)


func _on_overseas_check_box_toggled(toggled_on):
	if toggled_on == true :
		recycling_stations.add_child(OVERSEAS)
	else :
		recycling_stations.remove_child(OVERSEAS)
