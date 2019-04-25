extends Area2D
onready var inventory = $"/root/DemoLevel/CanvasLayer/GUI/Dropdown/ItemList"
var inArea = false
func _ready():

	pass # Replace with function body.




func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		inArea = true
		print("Can Open CRatE")

	
func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		inArea = false
		print("NAH DUDE")
		
func _input(event):
	if event.is_action_pressed("ui_interact") && inArea == true:
		print("Can Open CRatE")
		if inventory.inventoryTotal >= 28:
			print("INVENTORY FULL BUD!")
		else:
			var lootList = inventory.createCrate()
			for loot in lootList:
				inventory.addItem(loot)
			get_parent().get_parent().queue_free()




