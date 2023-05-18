extends CanvasLayer

@onready var main: Control = $Control
@onready var gen: Control = $Generation

const Json = preload("res://map_gen_json.gd")
var my_json: Json

func _ready():
	my_json = Json.new()

func _on_button_play_pressed() -> void:
	main.visible = false
	gen.visible = true


func _on_button_shop_pressed() -> void:
	get_tree().change_scene_to_file("res://src/shop.tscn")



func _on_button_gen_pressed() -> void:
	my_json.gen_map()


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://src/world.tscn")
