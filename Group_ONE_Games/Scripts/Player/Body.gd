extends KinematicBody2D

export var speed = 200 #how fast the player will move\
var screensize 

func _ready():
	Global.Body = self
	screensize = get_viewport_rect().size
	


func _physics_process(delta):
	var gain = (delta * 5)
	var velocity = Vector2(0,0)
	
	
	if Input.is_action_pressed('ui_shift'):
		var loss = (delta * 20)
		speed = 400
		Global_Player.lose_energy(loss)
		if Global_Player.energy == 0:
			speed = 50
			
	if !Input.is_action_pressed('ui_shift'):
		if Global_Player.energy < 100:
			Global_Player.gain_energy(gain)
		if Global_Player.energy == 0:
			speed = 50
		if Global_Player.energy >= 15:
			speed = 200
			
	if Input.is_action_just_released('ui_shift'):
			if Global_Player.energy >= 15:
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
		
	self.move_and_slide(velocity)
	

	if velocity.x != 0:
		$AnimatedSprite.animation = 'Right'
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	if velocity.y > 0:
		$AnimatedSprite.animation = 'Down'
	elif velocity.y != 0:
		$AnimatedSprite.animation = 'Up'
		$AnimatedSprite.flip_v = velocity.y > 0


