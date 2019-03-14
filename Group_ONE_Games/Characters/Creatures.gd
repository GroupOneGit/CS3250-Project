extends KinematicBody2D

var speed
var health
var attack
var creaturelist = ["crab"]
var drops

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func damage(key, amount):
	if key in creaturelist:
		pass
	else:
		health = health - amount

func setcreature(key):
	match key:
		"crab":
			speed = 100
			health = 10
			attack = 2
			# first value is item key second is its cutoff value.
			drops = [[5, 1.0]]

func death():
	randomize()
	var r = randf()
	for drop in drops:
		if drop[1] < r:
			var itemkey = drop[0]
	# make the drop item here
	free()
	
