extends ItemList
var index = 0
var itemSelected = null
var itemsSlotted = 0
onready var mainItemList = get_parent().get_parent().get_parent().get_parent().get_node("Dropdown/ItemList")
onready var Slot1 = get_parent().get_parent().get_node("Slot1/Item1")
onready var Slot2 = get_parent().get_parent().get_node("Slot2/Item2")
onready var Slot3 = get_parent().get_parent().get_node("Slot3/Item3")
onready var Slot4 = get_parent().get_parent().get_node("Slot4/Item4")

func _input(event):
	if ItemDatabase.heldItem == null:
		if event is InputEvent && event.is_action_pressed("Num_1"):
			grab_focus()
			itemSelected = Slot1.get_selected_items()
			if Slot1.itemsSlotted > 0:
				Slot1.select(0, true)
				itemSelected = Slot1.get_selected_items()
				Global_Inventory.eat(str(Slot1.get_item_metadata(itemSelected[0])))
				Slot1.removeItem(itemSelected[0])
			else:
				return
	
		if event is InputEvent && event.is_action_pressed("Num_2"):
			grab_focus()
			itemSelected = Slot2.get_selected_items()
			if Slot2.itemsSlotted > 0:
				Slot2.select(0, true)
				itemSelected = Slot2.get_selected_items()
				Global_Inventory.eat(str(Slot2.get_item_metadata(itemSelected[0])))
				Slot2.removeItem(itemSelected[0])
			else:
				return
	
		if event is InputEvent && event.is_action_pressed("Num_3"):
			grab_focus()
			itemSelected = Slot3.get_selected_items()
			if Slot3.itemsSlotted > 0:
				Slot3.select(0, true)
				itemSelected = Slot3.get_selected_items()
				Global_Inventory.eat(str(Slot3.get_item_metadata(itemSelected[0])))
				Slot3.removeItem(itemSelected[0])
			else:
				return
	
		if event is InputEvent && event.is_action_pressed("Num_4"):
			grab_focus()
			itemSelected = Slot4.get_selected_items()
			if Slot4.itemsSlotted > 0:
				Slot4.select(0, true)
				itemSelected = Slot4.get_selected_items()
				Global_Inventory.eat(str(Slot4.get_item_metadata(itemSelected[0])))
				Slot4.removeItem(itemSelected[0])
			else:
				return
	
	
func get_drag_data(position):
	var dragIcon = TextureRect.new()
	if is_anything_selected():
		itemSelected = get_selected_items()
		dragIcon.texture = get_item_icon(itemSelected[0])
	else:
		return
	set_drag_preview(dragIcon)
	ItemDatabase.heldItem = get_item_metadata(itemSelected[0])
	ItemDatabase.originalOwner = get_focus_owner().name
	ItemDatabase.holdingItem = true
	return itemSelected

func can_drop_data(position, data):
	grab_focus()
	return true
	pass	

func drop_data(position, data):
	if ItemDatabase.originalOwner != get_focus_owner().name:
		if ItemDatabase.originalOwner == mainItemList.name && itemsSlotted == 0:
			mainItemList.removeItem(data[0])
			addItem(ItemDatabase.heldItem)
		elif ItemDatabase.originalOwner == Slot1.name && itemsSlotted == 0:
			Slot1.removeItem(data[0])
			ItemDatabase.slot1Item = null
			addItem(ItemDatabase.heldItem)
		elif ItemDatabase.originalOwner == Slot2.name && itemsSlotted == 0:
			Slot2.removeItem(data[0])
			ItemDatabase.slot2Item = null
			addItem(ItemDatabase.heldItem)
		elif ItemDatabase.originalOwner == Slot3.name && itemsSlotted == 0:
			Slot3.removeItem(data[0])
			ItemDatabase.slot3Item = null
			addItem(ItemDatabase.heldItem)
		elif ItemDatabase.originalOwner == Slot4.name && itemsSlotted == 0:
			Slot4.removeItem(data[0])
			ItemDatabase.slot4Item = null
			addItem(ItemDatabase.heldItem)
		if ItemDatabase.originalOwner != self.name && ItemDatabase.originalOwner != mainItemList.name && itemsSlotted > 0:
			swapItem()
		elif itemsSlotted == 0:
			addItem(ItemDatabase.heldItem)
			
	if self.name == Slot1.name:
		ItemDatabase.slot1Item = ItemDatabase.heldItem
		ItemDatabase.heldItem = null
	elif self.name == Slot2.name:
		ItemDatabase.slot2Item = ItemDatabase.heldItem
		ItemDatabase.heldItem = null
	elif self.name == Slot3.name:
		ItemDatabase.slot3Item = ItemDatabase.heldItem
		ItemDatabase.heldItem = null
	elif self.name == Slot4.name:
		ItemDatabase.slot4Item = ItemDatabase.heldItem
		ItemDatabase.heldItem = null
		


	ItemDatabase.heldItem = null
	ItemDatabase.holdingItem = false
	unselect_all()
	release_focus()
	#TODO:: Add swap function to swap items between main slots.
	pass

func addItem(key):
	if itemsSlotted == 0:
		if key == 0:
			return
		elif key != null:
			var icon = ItemDatabase.ITEMS[str(key)].icon
			add_icon_item(icon, true)
			index = self.get_item_count() - 1
			set_item_tooltip(index, ItemDatabase.ITEMS[str(key)].description)
			set_item_metadata(index, key)
		if self.name == Slot1.name:
			ItemDatabase.slot1Item = key
		elif self.name == Slot2.name:
			ItemDatabase.slot2Item = key
		elif self.name == Slot3.name:
			ItemDatabase.slot3Item = key
		elif self.name == Slot4.name:
			ItemDatabase.slot4Item = key
		itemsSlotted += 1
	else:
		return

func removeItem(key):
	remove_item(key)
	if ItemDatabase.originalOwner == Slot1.name:
		ItemDatabase.slot1Item = null
	elif ItemDatabase.originalOwner == Slot2.name:
		ItemDatabase.slot2Item = null
	elif ItemDatabase.originalOwner == Slot3.name:
		ItemDatabase.slot3Item = null
	elif ItemDatabase.originalOwner == Slot4.name:
		ItemDatabase.slot4Item = null
	index -= 1
	itemsSlotted -= 1
	pass
	
func swapItem():
	var tempItem = null
	var tempSlot = originalSlotCheck()
	if tempSlot != null && itemsSlotted > 0 && tempSlot.itemsSlotted > 0:
		if self.name == Slot1.name:
			tempItem = ItemDatabase.slot1Item
			self.removeItem(0)
			self.addItem(ItemDatabase.heldItem)
			tempSlot.removeItem(0)
			tempSlot.addItem(tempItem)
		elif self.name == Slot2.name:
			tempItem = ItemDatabase.slot2Item
			self.removeItem(0)
			self.addItem(ItemDatabase.heldItem)
			tempSlot.removeItem(0)
			tempSlot.addItem(tempItem)
		elif self.name == Slot3.name:
			tempItem = ItemDatabase.slot3Item
			self.removeItem(0)
			self.addItem(ItemDatabase.heldItem)
			tempSlot.removeItem(0)
			tempSlot.addItem(tempItem)
		elif self.name == Slot4.name:
			tempItem = ItemDatabase.slot4Item
			self.removeItem(0)
			self.addItem(ItemDatabase.heldItem)
			tempSlot.removeItem(0)
			tempSlot.addItem(tempItem)
		pass
	
func originalSlotCheck():
	if ItemDatabase.originalOwner == Slot1.name:
		return Slot1
	elif ItemDatabase.originalOwner == Slot2.name:
		return Slot2
	elif ItemDatabase.originalOwner == Slot3.name:
		return Slot3
	elif ItemDatabase.originalOwner == Slot4.name:
		return Slot4
	else:
		return mainItemList
		
func originalSlotItemCheck():
	var slot = originalSlotCheck()
	if ItemDatabase.originalOwner == slot.name && slot.get_item_metadata(0) != null:
		return slot.get_item_metadata(0)
	elif ItemDatabase.originalOwner == slot.name && slot.get_item_metadata(0) != null:
		return slot.get_item_metadata(0)
	elif ItemDatabase.originalOwner == slot.name && slot.get_item_metadata(0) != null:
		return slot.get_item_metadata(0)
	elif ItemDatabase.originalOwner == slot.name && slot.get_item_metadata(0) != null:
		return slot.get_item_metadata(0)
			
			
func _notification(what):
#	if (what==NOTIFICATION_MOUSE_ENTER):
#    	  print('mouse entered the area of this control: ' + str(self.name))
#	elif (what==NOTIFICATION_MOUSE_EXIT):
#		 print('mouse exited the area of this control: ' + str(self.name))
	pass

func _on_Area2D_area_entered(area):
	print("ENTERED")
	pass # Replace with function body.

#
#func _on_Area2D_mouse_entered():
#	if ItemDatabase.heldItem != null:
#		var itemOwner = originalSlotCheck()
##		if Input.is_action_just_released("ui_LMB"):
##			print("released")
##			itemOwner.removeItem(itemOwner.itemSelected[0])
#		print(itemOwner)
#		print(itemOwner.itemSelected[0])
#		print("entered")
#		print("gonna drop")
#	pass # Replace with function body.


func _on_Area2D_input_event(viewport, event, shape_idx):	
	var itemOwner = originalSlotCheck()
	var mainNode = $"//root/DemoLevel"
	var itemObject = create_item_object(itemOwner.itemSelected[0])
	print(mainNode.name)
	itemObject.position = get_global_mouse_position() + Vector2(160,100)
	itemObject.scale.x = .75
	itemObject.scale.y = .75
	print(itemObject.position)
	
	
	if Input.is_action_just_released("ui_LMB"):
			print("released")
			itemOwner.removeItem(itemOwner.itemSelected[0])
			mainNode.add_child(itemObject)
	pass # Replace with function body.


func _on_Area2D2_input_event(viewport, event, shape_idx):
	var itemOwner = originalSlotCheck()
	if Input.is_action_just_released("ui_LMB"):
			print("released")
			itemOwner.removeItem(itemOwner.itemSelected[0])
	pass # Replace with function body.
	
	
func create_item_object(itemSelected):
	var item = Sprite.new()
	item.texture = ItemDatabase.ITEMS[str(ItemDatabase.heldItem)].icon
	return item