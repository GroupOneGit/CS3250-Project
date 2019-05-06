extends Node2D
onready var enemy = load("res://Scenes/Crab.tscn")
var t = .5
var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	nextT()

func nextT():
	t = 3.8*t*(1-t)
	time = t*20
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time = time - delta
	if time < 0 and self.get_child_count():
		var enemyinstance = enemy.instance()
		self.add_child(enemyinstance)
		nextT()
