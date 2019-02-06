extends KinematicBody2D

export var speed = 200 #how fast the player will move\
var screensize 

func _ready():
	screensize = get_viewport_rect().size


func _physics_process(delta):
	var velocity = Vector2(0,0)
	if Input.is_action_pressed('ui_shift'):
		speed = 400
		print('GOING FAST WOO')
	if Input.is_action_just_released('ui_shift'):
		speed = 200
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	self.move_and_collide(velocity * delta)

	if velocity.x != 0:
		$AnimatedSprite.animation = 'Right'
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	if velocity.y > 0:
		$AnimatedSprite.animation = 'Down'
	elif velocity.y != 0:
		$AnimatedSprite.animation = 'Up'
		$AnimatedSprite.flip_v = velocity.y > 0
		

