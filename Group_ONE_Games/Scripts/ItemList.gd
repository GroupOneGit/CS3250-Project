extends ItemList
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
		var rando = randi()%8
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
	ItemDatabase.originalOwner = get_focus_owner().name
	return itemSelected
	
func can_drop_data(position, data):
	grab_focus()
	return true
	pass
	

func drop_data(position, data):
	var dropSlot = get_item_at_position(get_local_mouse_position(),true)
	var heldItem = ItemDatabase.heldItem
	

			
	if ItemDatabase.originalOwner != get_focus_owner().name:
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
	else:
		if heldItem != null && dropSlot in range(0, self.get_item_count()):
			var tempItem = get_item_metadata(dropSlot)
			move_item(data[0], dropSlot)
			if dropSlot < data[0]:
				removeItem(dropSlot +  1)
			elif dropSlot == data[0]:
				return
			else:
				removeItem(dropSlot - 1)
			if ItemDatabase.originalOwner != get_focus_owner().name:
				addItem(ItemDatabase.heldItem)
			else:
				addItem(tempItem)
			var listSize = get_item_count()
			move_item(listSize - 1, itemSelected[0])
			if dropSlot == -1:
				addItem(ItemDatabase.heldItem)
			unselect_all()
		elif dropSlot == -1:
			if ItemDatabase.originalOwner != get_focus_owner().name:
				removeItem(itemSelected[0])
				addItem(ItemDatabase.heldItem)
			else:
				return
		ItemDatabase.heldItem = null
		pass


func createCrate():
	loot.resize(0)
	itemList.resize(0)
	var numItems = randi()%9
	var id 
	if (numItems + inventoryTotal) > MAX:
		numItems = MAX - inventoryTotal
	if numItems == 0:
		return
	else:
		for i in range(numItems):
			id = randi()%9
			if id == 0:
				pass
			elif id == 9:
				pass
			else:	
				loot.append(id)
	return loot


func addItems():
	if inventoryTotal < 28:
		for id in loot:
			if id == 0:
				return
			else:
				var icon = ItemDatabase.ITEMS[str(id)].icon
				add_icon_item(icon, true)
				index = self.get_item_count() - 1 
				set_item_tooltip(index, ItemDatabase.ITEMS[str(id)].description)
				set_item_metadata(index, id)
				inventoryTotal += 1
	else:
		return
		
func addItem(key):
	if inventoryTotal < 28:
		if key == 0:
			return
		else:
			var icon = ItemDatabase.ITEMS[str(key)].icon
			add_icon_item(icon, true)
			index = self.get_item_count() - 1
			set_item_tooltip(index, ItemDatabase.ITEMS[str(key)].description)
			set_item_metadata(index, key)
			inventoryTotal += 1
			print("INVTENTORY TOTAL: " + str(inventoryTotal))
	else:
		return
	
func removeItem(key):
	remove_item(key)
	index -= 1
	inventoryTotal -= 1
	print("INVTENTORY TOTAL: " + str(inventoryTotal))
	pass