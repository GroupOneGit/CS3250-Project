extends Node
onready var slot_bg = preload("res://GUI/HUD-ART/Inventory/InventorySlot.tscn")
onready var item_img = preload("res://GUI/HUD-ART/Inventory/Item.tscn")
onready var grid = $GridContainer
var item = null
var slotList = Array()

func _ready():
	for i in range(20):
		slotList.append(i)
		print(slotList.size())
		grid.add_child(slot_bg.instance())
		grid.get_child(i).add_child(item_img.instance())
		
		
	

func _process(delta):

	
	if Input.is_action_just_pressed("ui_focus_next"):
		if !self.is_visible():
			self.show()
		else:
			self.hide()

	
	


