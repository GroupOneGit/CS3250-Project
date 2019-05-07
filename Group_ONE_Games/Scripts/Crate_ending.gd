extends Area2D
onready var inventory = $"/root/DemoLevel/CanvasLayer/GUI/Dropdown/ItemList"
onready var crateLabel = get_parent().get_parent().get_node("Z_Index/Label")
onready var dialogBox = get_node("/root/DemoLevel/CanvasLayer/DialogBox/Panel/Text")
onready var videoPlayer = $"/root/DemoLevel/CanvasLayer/VideoPlayer"

var ending = preload("res://Cutscenes/Ending.ogv")

var inArea = false
var openedText = ["hmmm, it appears to be calling out for something...",
"It feels like I'm missing something..."]
signal opened
var numOfItems = 0


func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		inArea = true
		crateLabel.show()


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		inArea = false
		crateLabel.hide()

func _input(event):
	if event.is_action_pressed("ui_interact") && inArea == true && Global_Player.has_Hat && ItemDatabase.scrollsFound == 9:
		videoPlayer.play_scene(ending)
	elif event.is_action_pressed('ui_interact') && inArea == true:
		dialogBox.set_single_dialog_text(openedText[0])
	elif event.is_action_pressed('ui_interact') && inArea == true && Global_Player.has_Hat:
		dialogBox.set_single_dialog_text(openedText[1])



