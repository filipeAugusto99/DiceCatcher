extends Area2D


class_name Dice


# Constants
const SPEED = 100.0
const ROTATION_SPEED = 100.0


@onready var sprite_2d: Sprite2D = $Sprite2D

# the direction of the dice is random
var rotation_dir: float = 1.0


func _ready() -> void:
	# randf give two random numbers between 1.0 and 0.0 for default
	if randf() < 0.5: rotation_dir *= -1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > Game.get_vpr().end.y:
		die()
	
	
func _physics_process(delta: float) -> void:
	# This logic makes the dice fall up
	position.y += SPEED * delta
	sprite_2d.rotate(ROTATION_SPEED * rotation_dir)
	
	
func die() -> void:
	set_physics_process(false)
	queue_free()	
