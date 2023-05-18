extends CanvasLayer

@onready var main: Control = $Control
@onready var gen: Control = $Generation
@onready var gen2: Control = $Generation2

const Json = preload("res://map_gen_json.gd")
var my_json: Json

func _ready():
	my_json = Json.new()
	my_json.load_file2()

func _on_button_play_pressed() -> void:
	main.visible = false
	gen.visible = true


func _on_button_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://src/shop.tscn")

func _on_button_gen_menu_pressed() -> void:
	gen.visible = false
	gen2.visible = true

func _on_button_gen_pressed() -> void:
	my_json.gen_map(1)



func _on_button_start_pressed() -> void:
	if(FileAccess.file_exists(my_json.path)):
		get_tree().change_scene_to_file("res://src/world.tscn")


func _on_button_gen_2_pressed() -> void:
	my_json.gen_map(2)


func _on_button_atgal_pressed() -> void:
	gen.visible = true
	gen2.visible = false


func _on_button_history_pressed() -> void:
	get_tree().change_scene_to_file("res://src/history.tscn")
