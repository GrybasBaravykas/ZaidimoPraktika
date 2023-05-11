extends TileMap


var scroll_speed = 50

func _process(delta: float) -> void:
	if scroll_speed <= 300:
		scroll_speed += 0
		position.x -= scroll_speed * delta
		print(scroll_speed)
	else:
		position.x -= scroll_speed * delta
