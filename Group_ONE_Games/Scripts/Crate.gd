extends Area2D
onready var inventory = $"/root/DemoLevel/CanvasLayer/GUI/Dropdown/ItemList"
onready var crateLabel = get_parent().get_parent().get_node("Z_Index/Label")
onready var dialogBox = get_node("/root/DemoLevel/CanvasLayer/DialogBox/Panel/Text")
var inArea = false
var openedText = ["Ohhh a bunch of supplies!", 
				"Gah.. Nothing here",
				"I am carrying too much.",]
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
	if event.is_action_pressed("ui_interact") && inArea == true:
		if inventory.inventoryTotal >= 28:
			numOfItems = -1
			emit_signal("opened")
			return
		else:
			var lootList = inventory.createCrate()
			numOfItems = lootList.size()
			for loot in lootList:
				inventory.addItem(loot)
			emit_signal("opened")
			get_parent().get_parent().queue_free()


func _on_InteractArea_opened():
	#play sound
	if numOfItems == 0: #for getting no items
		dialogBox.set_single_dialog_text(openedText[1])
		return
	elif numOfItems == -1: #for inventory full
		dialogBox.set_single_dialog_text(openedText[2])
		return
	else:                #for getting # of items
		dialogBox.set_single_dialog_text(openedText[0])
		return

	
