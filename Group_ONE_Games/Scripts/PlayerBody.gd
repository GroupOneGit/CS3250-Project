extends KinematicBody2D

export var speed = 200 #how fast the player will move
var screensize 
var direction = Vector2(0,-1)
var velocity = Vector2(0,0)
var sprint = false
var move = false
var invTime = 0.0

func _ready():
	screensize = get_viewport_rect().size
	
func damage(thing, amt):
	if invTime > 0:
		pass
	elif !(thing == "player"):
		invTime =.5
		$AnimatedSprite.modulate = ColorN("red")
		Global_Player.take_damage(amt)
	
func heal(thing,amt):
	Global_Player.gain_health(amt)

func _input(event):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	elif event.is_action_released("ui_right"):
		velocity.x = 0
		
	if Input.is_action_pressed('ui_left'):
		velocity.x = -1
	elif event.is_action_released("ui_left"):
		velocity.x = 0
	
	if Input.is_action_pressed('ui_down'):
		velocity.y = 1
	elif event.is_action_released("ui_down"):
		velocity.y = 0
		
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1
	elif event.is_action_released("ui_up"):
		velocity.y=0
		
	move = (velocity != Vector2(0,0))
	
	if move:
		direction = velocity
	
	if Input.is_action_pressed('ui_shift'):
		sprint = true
	else:
		sprint = false

	if event.is_action_pressed('ui_attack'):
		if Global_Player.energy >= 5:
			$AudioStreamPlayer.play()
			Global_Player.lose_energy(5)
			$Attack.attack(10, direction.normalized())


func _physics_process(delta):
	invTime = invTime - delta
	if invTime < 0:
		$AnimatedSprite.modulate = ColorN("white")
	if sprint:
		if Global_Player.energy == 0:
			speed = 50
		elif move:
			speed = 400
			Global_Player.lose_energy(delta*10)

	else:
		if Global_Player.energy >= 15:
			speed = 200
		elif Global_Player.energy < 15 && Global_Player.energy > 0:
			speed = 100
		else:
			speed = 50
		Global_Player.gain_energy(delta*5)
		
	if not move:
		Global_Player.gain_energy(delta*5)
			

	if move:
		$AnimatedSprite.play()
		move_and_slide(velocity.normalized()*speed)
	else:
		$AnimatedSprite.stop()
		
	if Global_Player.has_Hat == true:
		if direction.x != 0:
			if direction.x >0:
				$AnimatedSprite.animation = 'Right_hat'
			else: 
				$AnimatedSprite.animation = 'Left_hat'
		elif direction.y > 0:
			$AnimatedSprite.animation = 'Down_hat'
		elif direction.y != 0:
			$AnimatedSprite.animation = 'Up_hat'
	else:
		if direction.x != 0:
			if direction.x >0:
				$AnimatedSprite.animation = 'Right'
			else: 
				$AnimatedSprite.animation = 'Left'
		elif direction.y > 0:
			$AnimatedSprite.animation = 'Down'
		elif direction.y != 0:
			$AnimatedSprite.animation = 'Up'

	
