extends CharacterBody2D

var gravity = 30
const jump_impulse = 500
var Wall = preload("res://src/walls.tscn")
var score = 0

const Json = preload("res://map_gen_json.gd")
var my_json: Json


func _ready():
	my_json = Json.new()
	my_json.load_file()

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
	Wall_instance.position = Vector2(1300,randi_range(150 + wall_pos * 20, 150 + wall_pos * 20))
	get_parent().call_deferred("add_child",Wall_instance) 


func _on_resseter_body_entered(body: Node2D) -> void:
	if body.name == "wall" :
		body.queue_free()
		Wall_reset() 
 


func _on_detect_area_entered(area: Area2D) -> void:
	if area.name == "pointarea":
		score += 1
		print(score);


func _on_detect_body_entered(body: Node2D) -> void:
	if body.name == "wall":
		get_tree().reload_current_scene()
	
