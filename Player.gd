extends KinematicBody2D

const UP: Vector2 = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -550
var motion: Vector2 = Vector2()

# NOTE: move_and_slide and is_on_floor is provided by KinematicBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):

	motion.y += GRAVITY
	var friction: bool = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
		friction = true
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT

		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction:
			motion.x = lerp(motion.x, 0, 0.02)

	motion = move_and_slide(motion, UP)
