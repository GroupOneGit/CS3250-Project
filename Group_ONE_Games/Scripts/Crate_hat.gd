extends Area2D
onready var inventory = $"/root/DemoLevel/CanvasLayer/GUI/Dropdown/ItemList"
onready var crateLabel = get_parent().get_parent().get_node("Z_Index/Label")
onready var dialogBox = get_node("/root/DemoLevel/CanvasLayer/DialogBox/Panel/Text")
onready var videoPlayer = $"/root/DemoLevel/CanvasLayer/VideoPlayer"

var openedCrateScene = preload("res://Cutscenes/Hat_Scene.ogv")

var inArea = false
var openedText = ["WoW! This hat is putting off weird vibrations! Let's hope this doesn't cause trouble..."]
signal opened
var numOfItems = 0


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		inArea = true
		crateLabel.show()


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		inArea = false
		crateLabel.hide()

func _input(event):
	if event.is_action_pressed("ui_interact") && inArea == true:
		videoPlayer.play_scene(openedCrateScene)
		Global_Player.has_Hat = true
		emit_signal("opened")
		get_parent().get_parent().queue_free()


func _on_InteractArea_opened():
	dialogBox.set_single_dialog_text(openedText[0])



