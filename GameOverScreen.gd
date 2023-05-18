extends CanvasLayer




func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://src/world.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://src/main_menu.tscn")
