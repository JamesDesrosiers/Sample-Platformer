extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 10
const MAX_SPEED = 300
const JUMP_HEIGHT = -400

const ACCELERATION = 10

var motion = Vector2()

# warning-ignore:unused_argument
func _physics_process(delta):
	#Gravity
	motion.y += GRAVITY

	#X-axis movement
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		if self.is_on_floor():
			motion.x = lerp(motion.x, 0, 0.10)
			# warning-ignore:integer_division
			if motion.x < MAX_SPEED / 2:
				$Sprite.play("Idle")
		else:
			motion.x = lerp(motion.x, 0, 0.01)

	if self.is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$Sprite.play("Jump")
	else:
		if motion.y < 0 :
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")

	motion = move_and_slide(motion, UP)
	pass