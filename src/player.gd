extends CharacterBody2D

var gravity = 30
const jump_impulse = 500
var Wall = preload("res://src/walls.tscn")
var score = 0

const Json = preload("res://map_gen_json.gd")
var my_json: Json
var wall_pos


func _ready():
	my_json = Json.new()
	my_json.load_file()
	#print(my_json.data.map_seed)
	for i in 7 * my_json.data.difficulty:
		var Wall_instance = Wall.instantiate()
		wall_pos = my_json.take_gen_val()
		print(wall_pos)
		Wall_instance.position = Vector2(400 + i * 400,170 + wall_pos * 35)
		get_parent().call_deferred("add_child",Wall_instance) 

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = 0
		velocity.y = -jump_impulse
	velocity.y += gravity 
	move_and_collide(velocity * delta)
	
	get_parent().get_node("CanvasLayer/RichTextLabel").text = str(score)


func _on_resseter_body_entered(body: Node2D) -> void:
	if body.name == "wall" :
		body.queue_free()
		if(score == 7 * my_json.data.difficulty + 4):
			my_json.data2.win+=1
			my_json.create_file2()
			game_over()
			


func _on_detect_area_entered(area: Area2D) -> void:
	if area.name == "pointarea":
		score += 1
		my_json.data2.exp += 10
		my_json.create_file2()


func _on_detect_body_entered(body: Node2D) -> void:
	if body.name == "wall":
		pass
		#game_over()
	

func _on_lowerdetect_area_entered(area: Area2D) -> void:
	game_over()

func game_over():
	my_json.data2.loss += 1 
	my_json.create_file2()
	get_tree().change_scene_to_file("res://src/game_over_screen.tscn")
	
