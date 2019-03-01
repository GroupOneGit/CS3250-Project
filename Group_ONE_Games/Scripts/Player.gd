extends Node2D

onready var player = $"../Player"



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	manual_damage()
	health_to_zero(delta)

func health_to_zero(delta):
	Global_Player.take_damage(delta * .25)
	if Global_Player.health < .5:
		Global_Player.end_game()
	
	

func manual_damage():
	
	if Input.is_action_just_pressed('ui_page_down'):
		Global_Player.dehydrate(25)
		Global_Player.take_damage(19)
		Global_Player.lose_energy(18)
	
	if Input.is_action_just_pressed('ui_page_up'):
		Global_Player.gain_health(10)
		Global_Player.gain_energy(5)
		Global_Player.rehydrate(3)