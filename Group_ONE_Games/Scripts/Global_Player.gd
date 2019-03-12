extends Node

signal health_changed
signal thirst_changed
signal energy_changed

var current_scene_name = ""
var MAX_health = 100
var MAX_thirst = 100
var MAX_energy = 100

var health = MAX_health
var thirst = MAX_thirst
var energy = MAX_energy


func _process(delta):
	dehydrate(0.5 , delta)
	if Input.is_action_just_pressed('ui_page_down'):
		lose_thirst(10)
		lose_energy(10)
		take_damage(10)
	if Input.is_action_just_pressed('ui_page_up'):
		gain_energy(10)
		gain_health(10)
		gain_thirst(10)
	

func end_game():
	get_tree().change_scene("res://Scenes/EndGameScreen.tscn")
	
func full_health():
	health = MAX_health
	thirst = MAX_thirst
	energy = MAX_energy
	
func take_damage(amount):
	health -= amount
	if health < 0:
		health = 0
	emit_signal("health_changed", round(health))

func gain_health(amount):
	if health < 100:
		health += amount
		if health > 100:
			health = 100
		emit_signal("health_changed", round(health))
		
func lose_thirst(amount):
	if thirst > 0:
		thirst -= amount
		if thirst < 0:
			thirst = 0
		emit_signal("thirst_changed",round(thirst))
		
func gain_thirst(amount):
	if thirst < 100:
		thirst += amount
		if thirst > 100:
			thirst = 100
		emit_signal("thirst_changed" , round(thirst))
		
		
func lose_energy(amount):
	if energy > 0:
		energy -= amount
		if energy <= 0:
			energy = 0
		emit_signal("energy_changed", round(energy))
		
func gain_energy(amount):
	if energy < 100:
		energy += amount
		if energy > 100:
			energy = 100
	emit_signal("energy_changed" , round(energy))

func dehydrate(amount, delta):
	current_scene_name = str(get_tree().current_scene.name)
	if current_scene_name == "DemoLevel":
		if thirst > 0:
			if energy < 15:
				lose_thirst((amount * 5) * delta)
			else:
				lose_thirst(amount * delta)
		if thirst == 0:
			if energy < 25:
				take_damage(3 * delta)
			else:
				take_damage(0.75 * delta)
		
	

