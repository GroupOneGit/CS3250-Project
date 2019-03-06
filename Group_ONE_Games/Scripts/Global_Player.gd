extends Node

signal health_changed
signal thirst_changed
signal energy_changed

var MAX_health = 100
var MAX_thirst = 100
var MAX_energy = 100
var health = MAX_health
var thirst = MAX_thirst
var energy = MAX_energy


func end_game():
	get_tree().change_scene("res://Scenes/EndGameScreen.tscn")
	
func full_health():
	health = MAX_health

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
		
func dehydrate(amount):
	if thirst > 0:
		thirst -= amount
		if thirst < 0:
			thirst = 0
		emit_signal("thirst_changed",round(thirst))
		
func rehydrate(amount):
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
			
