extends ItemList
#warning-ignore-all:unused_variable
var index = 0
var itemSelected = null
var itemsSlotted = 0
onready var mainItemList = get_parent().get_parent().get_parent().get_parent().get_node("Dropdown/ItemList")
onready var Slot1 = get_parent().get_parent().get_node("Slot1/Item1")
onready var Slot2 = get_parent().get_parent().get_node("Slot2/Item2")
onready var Slot3 = get_parent().get_parent().get_node("Slot3/Item3")
onready var Slot4 = get_parent().get_parent().get_node("Slot4/Item4")
onready var itemObject = load("res://Scenes/Dropped_Item.tscn")
onready var dropDown = get_parent().get_parent().get_parent().get_parent().get_node("Dropdown")
onready var panel = get_parent().get_parent().get_parent().get_parent().get_node("Area2D/Panel")
onready var panel2 = get_parent().get_parent().get_parent().get_parent().get_node("Area2D2/Panel2")
var offset = Vector2(600,220)
var leftOffset = Vector2(520, 220)

func _process(delta):
	if ItemDatabase.holdingItem == true && dropDown.is_visible():
		panel.show()
		panel2.show()
	else:
		panel.hide()
		panel2.hide()
	
func _input(event):
	if ItemDatabase.holdingItem == false:
		if event is InputEvent && event.is_action_pressed("Num_1"):
			grab_focus()
			itemSelected = Slot1.get_selected_items()
			if Slot1.itemsSlotted > 0:
				Slot1.select(0, true)
				itemSelected = Slot1.get_selected_items()
				Global_Inventory.eat(str(Slot1.get_item_metadata(itemSelected[0])))
				Slot1.removeItem(itemSelected[0])
				ItemDatabase.heldItem = null
				ItemDatabase.holdingItem = false
				unselect_all()
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
				ItemDatabase.heldItem = null
				ItemDatabase.holdingItem = false
				unselect_all()
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
				ItemDatabase.heldItem = null
				ItemDatabase.holdingItem = false
				unselect_all()
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
				ItemDatabase.heldItem = null
				ItemDatabase.holdingItem = false
				unselect_all()
			else:
				return


func get_drag_data(position):
	var dragIcon = TextureRect.new()
	if is_anything_selected():
		itemSelected = get_selected_items()
		dragIcon.texture = get_item_icon(itemSelected[0])
	elif self.get_item_count() > 0:
		itemSelected = select(0, true)
	else:
		return
	set_drag_preview(dragIcon)
	ItemDatabase.heldItem = get_item_metadata(itemSelected[0])
	ItemDatabase.originalOwner = get_focus_owner().name
	ItemDatabase.holdingItem = true
	print(ItemDatabase.heldItem)
	return itemSelected


func can_drop_data(position, data):
	grab_focus()
	return true	


func drop_data(position, data):
	if ItemDatabase.originalOwner != get_focus_owner().name && ItemDatabase.heldItem != null:
		if ItemDatabase.originalOwner == mainItemList.name && itemsSlotted == 0:
			mainItemList.removeItem(data[0])
			addItem(ItemDatabase.heldItem)
		elif ItemDatabase.originalOwner == Slot1.name && itemsSlotted == 0:
			Slot1.removeItem(data[0])
			ItemDatabase.slot1Item = null
			addItem(ItemDatabase.heldItem)
			ItemDatabase.slot1Item = ItemDatabase.heldItem
			ItemDatabase.heldItem = null
			ItemDatabase.holdingItem = false
		elif ItemDatabase.originalOwner == Slot2.name && itemsSlotted == 0:
			Slot2.removeItem(data[0])
			ItemDatabase.slot2Item = null
			addItem(ItemDatabase.heldItem)
			ItemDatabase.slot2Item = ItemDatabase.heldItem
			ItemDatabase.heldItem = null
			ItemDatabase.holdingItem = false
		elif ItemDatabase.originalOwner == Slot3.name && itemsSlotted == 0:
			Slot3.removeItem(data[0])
			ItemDatabase.slot3Item = null
			addItem(ItemDatabase.heldItem)
			ItemDatabase.slot3Item = ItemDatabase.heldItem
			ItemDatabase.heldItem = null
			ItemDatabase.holdingItem = false
		elif ItemDatabase.originalOwner == Slot4.name && itemsSlotted == 0:
			Slot4.removeItem(data[0])
			ItemDatabase.slot4Item = null
			addItem(ItemDatabase.heldItem)
			ItemDatabase.slot4Item = ItemDatabase.heldItem
			ItemDatabase.heldItem = null
			ItemDatabase.holdingItem = false
		elif ItemDatabase.originalOwner != self.name && ItemDatabase.originalOwner != mainItemList.name && itemsSlotted > 0:
			print(ItemDatabase.originalOwner)
			print(itemsSlotted)
			swapItem()
		else:
			print("dunno")
	ItemDatabase.heldItem = null
	ItemDatabase.holdingItem = false
	ItemDatabase.originalOwner = null
	unselect_all()
	release_focus()
	pass


func addItem(key):
	if itemsSlotted == 0:
		if key != null:
			var icon = ItemDatabase.ITEMS[str(key)].icon
			add_icon_item(icon, true)
			index = self.get_item_count() - 1
			var itemTooltip = ItemDatabase.ITEMS[str(key)].description + "\n    Health: " + str(ItemDatabase.ITEMS[str(key)].healthEffect)
			itemTooltip = itemTooltip + "\n    Thirst: " + str(ItemDatabase.ITEMS[str(key)].thirstEffect)
			set_item_tooltip(index, itemTooltip)
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
			ItemDatabase.holdingItem = false
			ItemDatabase.heldItem = null
	else:
		ItemDatabase.holdingItem = false
		ItemDatabase.heldItem = null
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
	ItemDatabase.holdingItem = true
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
	ItemDatabase.holdingItem = false


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

func _on_Area2D_input_event(viewport, event, shape_idx):	
	if dropDown.is_visible():
		var itemOwner = originalSlotCheck()
		print(itemOwner)
		print(itemOwner.itemSelected)
		var mainNode = $"//root/DemoLevel/Dropped_Items"
		var player = $"//root/DemoLevel/Player/KinematicBody2D"
		var itemInstance = itemObject.instance()

		if Input.is_action_just_released("ui_LMB") && ItemDatabase.heldItem != null:
				itemOwner.removeItem(itemOwner.itemSelected[0])
				mainNode.add_child(itemInstance)
				itemInstance.texture = ItemDatabase.ITEMS[str(ItemDatabase.heldItem)].icon
				itemInstance.itemData = ItemDatabase.heldItem
				itemInstance.position = player.position + leftOffset
				ItemDatabase.holdingItem = false
				ItemDatabase.heldItem = null
				ItemDatabase.originalOwner = null
	else:
		return


func _on_Area2D2_input_event(viewport, event, shape_idx):
	if dropDown.is_visible():
		var itemOwner = originalSlotCheck()
		print(itemOwner.name)
		print(itemOwner.itemSelected)
		var mainNode = $"//root/DemoLevel/Dropped_Items"
		var player = $"//root/DemoLevel/Player/KinematicBody2D"
		var itemInstance = itemObject.instance()
		
		if Input.is_action_just_released("ui_LMB") && ItemDatabase.heldItem != null:
				itemOwner.removeItem(itemOwner.itemSelected[0])
				mainNode.add_child(itemInstance)
				itemInstance.texture = ItemDatabase.ITEMS[str(ItemDatabase.heldItem)].icon
				itemInstance.itemData = ItemDatabase.heldItem
				itemInstance.position = player.position + offset
				ItemDatabase.holdingItem = false
				ItemDatabase.heldItem = null
				ItemDatabase.originalOwner = null
	else:
		return



func _on_Area2D3_input_event(viewport, event, shape_idx):
	if Input.is_action_just_released("ui_LMB") && ItemDatabase.heldItem != null:
		ItemDatabase.originalOwner = null
		ItemDatabase.heldItem = null
		ItemDatabase.holdingItem = false



func _on_Area2D2_mouse_entered():
	print("entered")
	pass # Replace with function body.
