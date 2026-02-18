extends Area2D


class_name myDice


# Constants
const SPEED = 100.0
const ROTATION_SPEED = 100.0


signal game_over


@onready var sprite_2d: Sprite2D = $Sprite2D

# the direction of the dice is random
var rotation_dir: float = 1.0


func _ready() -> void:
	# randf give two random numbers between 1.0 and 0.0 for default
	if randf() < 0.5: rotation_dir *= -1
	

func _physics_process(delta: float) -> void:
	# This logic makes the dice fall up
	position.y += SPEED * delta
	# rotate the sprite
	sprite_2d.rotate(ROTATION_SPEED * rotation_dir)
	check_game_over()
	
# this function is responsible for removing the dice from the game
func die() -> void:
	# pause all processes of the dice
	set_physics_process(false)
	# remove the dice / delete from the game
	queue_free()	
	

# That function is responsible for the end of the game
func check_game_over() -> void:
	if position.y > Game.get_vpr().end.y:
			game_over.emit()
			die()
