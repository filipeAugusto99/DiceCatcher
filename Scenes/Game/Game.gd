extends Node2D


class_name Game


const DICE = preload("uid://dqkcwymqyymme")
const MARGIN: float = 80.0


static var _vp_r: Rect2


static func get_vpr() -> Rect2:
	return _vp_r

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_vp()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update_vp() -> void:
	_vp_r = get_viewport_rect()


func spawn_dices() -> void:
	var new_dice: myDice = DICE.instantiate()
	
	var pos_x = randf_range(
		_vp_r.position.x + MARGIN,
		_vp_r.end.x - MARGIN
	)
	
	new_dice.position = Vector2(pos_x, -MARGIN)
	new_dice.game_over.connect(_on_dice_game_over)
	
	add_child(new_dice)
	

func _on_dice_game_over() -> void:
	print("Game Over")


func _on_spawn_timer_timeout() -> void:
	spawn_dices()
