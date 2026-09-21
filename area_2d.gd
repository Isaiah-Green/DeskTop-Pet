extends Area2D
@onready var sprite = $AnimatedSprite2D
@onready var timer:Timer = $Timer
@onready var walk = false
func _ready() -> void:
	timer.start(5)
	timer.timeout.connect(_on_timer_timeout)
	pass
@onready var mouse_left_down: bool = false
func _input( event ):
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false
func _process(float):
	if mouse_left_down:
		FollowMouse()
	if walk:
		sprite.play("Walk")
		var s = get_viewport_rect().size
		if(s.x > global_position.x):
			global_position.x += 0.35
	var vis = get_viewport().get_camera_2d()
	vis = vis.get_screen_center_position() + (get_viewport_rect().size/2)
	if global_position.x > vis.x:
		global_position.x = -350
func _on_timer_timeout():
	var array = [1,2,3,4,5]
	var temp = array.pick_random()
	if temp == 1:
		walk = false
		sprite.play("Idle")
	elif temp == 2:
		walk = true
	elif temp == 3:
		walk = false
		Attack()
	elif temp == 4:
		walk = false
		Protect()
	elif temp == 5:
		walk = false
		Speak()
func FollowMouse():
	var mp = get_global_mouse_position()
	set_global_position(mp)
func walk_sprite():
	sprite.play("Walk")
	global_position.x += 0.5
func Attack():
	sprite.play("Attack")
	var t = sprite.is_playing()
	if !t:
		sprite.play("Book")
func Speak():
	sprite.play("Dialogue")
func Protect():
	sprite.play("Protection")
	


	
	
