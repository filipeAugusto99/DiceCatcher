extends Node2D


class_name Game


static var _vp_r: Rect2


static func get_vpr() -> Rect2:
	return _vp_r

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func update() -> void:
	_vp_r = get_viewport_rect()
