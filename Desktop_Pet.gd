extends Node2D
@onready var sprite = $Area2D/AnimatedSprite2D
@onready var collision = $Area2D/AnimatedSprite2D/CollisionPolygon2D
func _ready():
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP, true)
	sprite.play("Idle")
func _process(float):
	await get_tree().process_frame
	var global_polygon = []
	for point in collision.polygon:
		var global_pos = collision.to_global(point)
		var screen_pos = get_viewport().get_canvas_transform() * global_pos
		global_polygon.append(screen_pos)
	DisplayServer.window_set_mouse_passthrough(global_polygon)
	

	
		
