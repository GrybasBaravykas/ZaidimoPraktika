extends CharacterBody2D
class_name Actor

var gravity = 30
const jump_impulse = 800

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = 0
		velocity.y = -jump_impulse
	velocity.y += gravity 
	move_and_collide(velocity * delta)
