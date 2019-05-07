extends Node2D
#onready var popUpScrollScene = preload("res://Scenes/PopUpScroll.tscn")
onready var demoLevel = get_node("/root/DemoLevel")


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		self.queue_free()
		get_tree().paused = false


func _on_Timer_timeout():
	self.queue_free()
	get_tree().paused = false
