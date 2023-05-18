extends CharacterBody2D

var gravity = 30
const jump_impulse = 500
var Wall = preload("res://src/walls.tscn")
var score = 1


const Json = preload("res://map_gen_json.gd")
var my_json: Json

var textures = [
			'res://assets/player2.png',
			'res://assets/player3.png',
]


func _ready():
	my_json = Json.new()
	my_json.load_file()
	#print(my_json.data.map_seed)
	$Player.texture = load(textures[1])
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = 0
		velocity.y = -jump_impulse
	velocity.y += gravity 
	move_and_collide(velocity * delta)
	
	get_parent().get_node("CanvasLayer/RichTextLabel").text = str(score)


func Wall_reset():  
	var Wall_instance = Wall.instantiate()
	var wall_pos = my_json.take_gen_val()
	print(wall_pos)
	Wall_instance.position = Vector2(1300,170 + wall_pos * 35)
	get_parent().call_deferred("add_child",Wall_instance) 


func _on_resseter_body_entered(body: Node2D) -> void:
	if body.name == "wall" :
		body.queue_free()
		if(score < 13):
			Wall_reset() 
		if(score == 17):
			game_over()
			my_json.data2.win+=1


func _on_detect_area_entered(area: Area2D) -> void:
	if area.name == "pointarea":
		score += 1
		my_json.data2.exp += 10


func _on_detect_body_entered(body: Node2D) -> void:
	if body.name == "wall":
		#game_over()
		pass
	

func _on_lowerdetect_area_entered(area: Area2D) -> void:
	game_over()

func game_over():
	get_tree().change_scene_to_file("res://src/game_over_screen.tscn")
	my_json.data2.death += 1


