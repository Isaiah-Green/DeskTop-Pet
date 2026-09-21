extends CollisionPolygon2D
func _ready() -> void:
	pass
	
@onready var mouse_left_down: bool = false
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
func _process(some_change):
	if mouse_left_down:
		FollowMouse()
				# Perform some stuff.
func FollowMouse():
	var mp = get_global_mouse_position()
	set_global_position(mp)
