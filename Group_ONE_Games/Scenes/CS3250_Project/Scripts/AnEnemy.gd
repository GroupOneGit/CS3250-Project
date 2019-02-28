extends "res://Scripts/Enemy.gd"

var motion = Vector2()

func _process(delta):
	update_motion(delta)
	move_and_slide(motion)
	update_animation(motion)

func update_animation(motion):
	$AnimatedSprite.update(motion)


func update_motion(delta):
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp((motion.y - SPEED), -MAXI_SPEED, 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0, MAXI_SPEED)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)

	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp((motion.x + SPEED), 0, MAXI_SPEED)
		
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp((motion.x - SPEED), -MAXI_SPEED, 0)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
