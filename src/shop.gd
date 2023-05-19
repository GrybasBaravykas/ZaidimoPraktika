extends Node
var store = {
			'selected' : 1,
}
const Json = preload("res://map_gen_json.gd")
var my_json: Json
# Called when the node enters the scene tree for the first time.
func _ready():
	my_json = Json.new()
	my_json.load_file2()

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://src/main_menu.tscn")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_button_to_get_original_skin_pressed() -> void:
	store.selected = 0
	$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_get_original_skin.text = "Equiped"
	if my_json.default_data2.skin1 == 1:
		$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_litning_skin.text = "Use"
	if my_json.default_data2.skin2 == 1:
		$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_lithuanian_skin.text = "Use"
func _on_button_to_buy_litning_skin_pressed() -> void:
	if my_json.default_data2.skin1 == 0 :
		if my_json.default_data2.gold >= 100:
			$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_litning_skin.text = "Use"
			my_json.default_data2.skin1 = 1
	else:
		store.selected = 1
		$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_litning_skin.text = "Equiped"
		$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_get_original_skin.text = "Use"
		if my_json.default_data2.skin2 == 1:
			$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_lithuanian_skin.text = "Use"


func _on_button_to_buy_lithuanian_skin_pressed() -> void:
	if my_json.default_data2.skin2 == 0 :
		if my_json.default_data2.gold >= 100:
			$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_lithuanian_skin.text = "Use"
			my_json.default_data2.skin2 = 1
	else:
		store.selected = 2
		$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_lithuanian_skin.text = "Equiped"
		$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_get_original_skin.text = "Use"
		if my_json.default_data2.skin1 == 1:
			$CanvasLayer/Control/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Button_to_buy_litning_skin.text = "Use"
