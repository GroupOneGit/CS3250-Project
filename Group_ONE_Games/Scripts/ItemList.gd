extends ItemList
#warning-ignore-all:unused_variable
var loot = Array()
var itemList = Array()
var k
var item = null
var MAX = 28
var currentIndex = 0
var inventoryTotal = 0
var itemSelected = null
var inventoryContents = PoolIntArray()
var index = 0
onready var Slot1 = get_parent().get_parent().get_node("Background/MainItems/Slot1/Item1")
onready var Slot2 = get_parent().get_parent().get_node("Background/MainItems/Slot2/Item2")
onready var Slot3 = get_parent().get_parent().get_node("Background/MainItems/Slot3/Item3")
onready var Slot4 = get_parent().get_parent().get_node("Background/MainItems/Slot4/Item4")

func _input(event):
	if event is InputEvent and event.is_action_pressed("ui_select"):
		print("testing")
		var rando = randi()%10
		addItem(rando)


func _ready():
	pass




func get_drag_data(position):
	var dragIcon = TextureRect.new()
	if is_anything_selected():
		itemSelected = get_selected_items()
		dragIcon.texture = get_item_icon(itemSelected[0])
	else:
		return
	print("ITEM SELECTED: " + str(itemSelected))
	print("ITEM DICT KEY 1 : " + str(get_item_metadata(itemSelected[0])))
	set_drag_preview(dragIcon)
	ItemDatabase.heldItem = get_item_metadata(itemSelected[0])
	ItemDatabase.holdingItem = true
	ItemDatabase.originalOwner = get_focus_owner().name
	return itemSelected

func can_drop_data(position, data):
	grab_focus()
	return true
	


func drop_data(position, data):
	var dropSlot = get_item_at_position(get_local_mouse_position(),true)
	var heldItem = ItemDatabase.heldItem
	

			
	if ItemDatabase.originalOwner != get_focus_owner().name && ItemDatabase.heldItem != null: 
		if inventoryTotal < 28:
			addItem(ItemDatabase.heldItem)
			if ItemDatabase.originalOwner == Slot1.name:
				Slot1.removeItem(0)
			elif ItemDatabase.originalOwner == Slot2.name:
				Slot2.removeItem(0)
			elif ItemDatabase.originalOwner == Slot3.name:
				Slot3.removeItem(0)
			elif ItemDatabase.originalOwner == Slot4.name:
				Slot4.removeItem(0)	
		ItemDatabase.holdingItem = false
	else:
		if heldItem != null && dropSlot in range(0, self.get_item_count()):
			var tempItem = get_item_metadata(dropSlot)
			move_item(data[0], dropSlot)
			if dropSlot < data[0]:
				removeItem(dropSlot +  1)
			elif dropSlot == data[0]:
				ItemDatabase.holdingItem = false
				return
			else:
				removeItem(dropSlot - 1)
				ItemDatabase.holdingItem = false
			if ItemDatabase.originalOwner != get_focus_owner().name:
				addItem(ItemDatabase.heldItem)
			else:
				addItem(tempItem)
			var listSize = get_item_count()
			move_item(listSize - 1, itemSelected[0])
			if dropSlot == -1:
				addItem(ItemDatabase.heldItem)
				ItemDatabase.holdingItem = false
			unselect_all()
		elif dropSlot == -1 && itemSelected != null:
			if ItemDatabase.originalOwner != get_focus_owner().name:
				removeItem(itemSelected[0])
				addItem(ItemDatabase.heldItem)
				ItemDatabase.holdingItem = false
			else:
				ItemDatabase.holdingItem = false
				return
		else:
			ItemDatabase.heldItem = null
			ItemDatabase.holdingItem = false
	ItemDatabase.holdingItem = false
	ItemDatabase.originalOwner = null
	unselect_all()
	release_focus()
	pass


func createCrate():
	loot.resize(0)
	itemList.resize(0)
	var numItems = randi()%10
	var id 
#warning-ignore:unused_variable
	for i in range(numItems):
		id = randi()%10
		loot.append(id)
	return loot


func addItems():
	if loot.size() == 0:
		print("NO ITEMS")
		return
	if inventoryTotal < 28:
		for id in loot:
				var icon = ItemDatabase.ITEMS[str(id)].icon
				add_icon_item(icon, true)
				index = self.get_item_count() - 1
				set_item_tooltip(index, ItemDatabase.ITEMS[str(id)].description)
				set_item_metadata(index, id)
				inventoryTotal += 1
				ItemDatabase.heldItem = null
				ItemDatabase.holdingItem = false
	else:
		ItemDatabase.holdingItem = false
		return
		
func addItem(key):
	print("ORIGNAL OWNER: " + str(ItemDatabase.originalOwner))
	if ItemDatabase.originalOwner == null:
		if Slot1.get_item_count() == 0:
			Slot1.addItem(key)
			return
		elif Slot2.get_item_count() == 0:
			Slot2.addItem(key)
			return
		elif Slot3.get_item_count() == 0:
			Slot3.addItem(key)
			return
		elif Slot4.get_item_count() == 0:
			Slot4.addItem(key)
			return
		else:
			pass
	if inventoryTotal < 28:
			var icon = ItemDatabase.ITEMS[str(key)].icon
			add_icon_item(icon, true)
			index = self.get_item_count() - 1
			var itemTooltip = ItemDatabase.ITEMS[str(key)].description + "\n    Health: " + str(ItemDatabase.ITEMS[str(key)].healthEffect)
			itemTooltip = itemTooltip + "\n    Thirst: " + str(ItemDatabase.ITEMS[str(key)].thirstEffect)
			set_item_tooltip(index, itemTooltip)
			set_item_metadata(index, key)
			inventoryTotal += 1
			ItemDatabase.heldItem = null
			ItemDatabase.holdingItem = false
			print("INVTENTORY TOTAL: " + str(inventoryTotal))
	else:
		ItemDatabase.holdingItem = false
		return
	
func removeItem(key):
	remove_item(key)
	index -= 1
	inventoryTotal -= 1
	print("INVTENTORY TOTAL: " + str(inventoryTotal))
	pass