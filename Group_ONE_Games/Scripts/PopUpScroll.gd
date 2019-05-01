extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Texture/TextLabel.push_align(RichTextLabel.ALIGN_CENTER)
	pass # Replace with function body.


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		self.queue_free()
		get_tree().paused = false


func _on_Timer_timeout():
	self.queue_free()
	get_tree().paused = false