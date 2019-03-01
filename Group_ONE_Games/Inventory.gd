extends Node
onready var slot_bg = preload("res://GUI/HUD-ART/Inventory/InventorySlot.tscn")
onready var item_img = preload("res://GUI/HUD-ART/Inventory/Item.tscn")
onready var grid = $GridContainer
var item = null
var MAX = 28
var loot = Array()
var currentIndex

func createCrate():
	var numItems = randi()%6
	var b 
	if numItems == 0:
		return
	else:
		for i in range(numItems):
			b = randi()%28
			if b == 0:
				pass
			elif b == 9:
				pass
			else:	
				loot.append(b)
				currentIndex = loot.size()
				if currentIndex < MAX:
					grid.get_child(currentIndex).add_child(item_img.instance())
		return

func _ready():
	for i in range(28):
#		slotList.append(i)
#		print(slotList.size())
		grid.add_child(slot_bg.instance())
		
	

func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		if !self.is_visible():
			self.show()
		else:
			self.hide()
	if Input.is_action_just_pressed("ui_accept"):
		if loot.size() >= MAX:
			print("Inventory full")
		else:
			createCrate()
			print(loot.size())
			print(loot)
			

	


