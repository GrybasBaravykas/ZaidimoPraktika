extends CanvasLayer

@onready var main: Control = $Control



func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://src/world.tscn")


func _on_button_shop_pressed() -> void:
	pass # Replace with function body.
