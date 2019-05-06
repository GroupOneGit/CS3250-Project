extends KinematicBody2D

var speed = 0
var health = 0 
var attack = 0
var creaturelist = ["crab", "tikiman"]
var drops = []
onready var itemObject = load("res://Scenes/Dropped_Item.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func damage(key, amount):
	if key in creaturelist:
		pass
	else:
		health = health - amount
		print(health)
	if health <= 0:
		death()

func setcreature(key):
	match key:
		"crab":
			speed = 100
			health = 10
			attack = 2
			# first value is item key second is its wieght, weights should add to be less than one.
			drops = [[5, .8]]
		"tikiman":
			speed = 200
			health = 100
			attack = 10
			# first value is item key second is its wieght, weights should add to be less than one.
			drops = [[-1, 1]]

func death():
	randomize()
	var r = randf()
	var parentNode = self.get_parent()
	var itemkey = -1
	
	var i = 0
	for drop in drops:
		i = i + drop[1]
		if r < i:
			itemkey = drop[0]

	var Item = ItemDatabase.ITEMS.get(itemkey)
	
	if Item:
		print("item dropped")
		var itemInstance = itemObject.instance()
		itemInstance.texture = Item.icon
		itemInstance.itemData = Item

	else:
		queue_free()
	
	