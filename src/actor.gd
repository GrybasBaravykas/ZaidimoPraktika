extends CharacterBody2D

var gravity = 30
const jump_impulse = 500
var Wall = preload("res://src/level/walls.tscn")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = 0
		velocity.y = -jump_impulse
	velocity.y += gravity 
	move_and_collide(velocity * delta)

func Wall_reset(): 
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(450,randf_range(-60,60))
	get_parent().call_deferred("add_child",Wall_instance)

func _on_reseter_body_entered(body: Node2D) -> void:
	if body.name == "Wall" : 
		body.queue_free()
		Wall_reset() 
