extends Node2D

# class member variables go here, for example:
var time = 0.0

func _ready(amount):
	for body in $Area2D.get_overlapping_bodies():
		if body.has_method("damage"):
			body.damage("player", amount)

func _process(delta):
	time = time+delta
	if time > .5:
		queue_free()