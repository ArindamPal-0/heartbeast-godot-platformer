extends KinematicBody2D

const UP: Vector2 = Vector2(0, -1)
var motion: Vector2 = Vector2()

# NOTE: move_and_slide and is_on_floor is provided by KinematicBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):

	motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	else:
		motion.x = 0

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -400

	var _final = move_and_slide(motion, UP)
