extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://src/main_menu.tscn")
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
