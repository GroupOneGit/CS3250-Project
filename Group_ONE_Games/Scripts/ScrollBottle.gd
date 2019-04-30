extends Node2D

var inArea = false
onready var scrollOnShelf1 = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/Scroll1")
onready var scrollIMG = preload("res://Art/Items/Bottle_Message.png")

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Player"):
		print("true")
		inArea = true



func _on_InteractArea_body_exited(body):
	if body.is_in_group("Player"):
		inArea = false



func _input(event):
	if event.is_action_pressed("ui_interact") && inArea == true:
		queue_free()
		scrollOnShelf1.texture = scrollIMG



