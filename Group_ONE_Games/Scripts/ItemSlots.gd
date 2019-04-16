extends ItemList
var index = 0
var itemSelected = null
var itemsSlotted = 0
onready var mainItemList = get_parent().get_parent().get_parent().get_parent().get_node("Dropdown/ItemList")
onready var Slot1 = get_parent().get_parent().get_node("Slot1/Item1")
onready var Slot2 = get_parent().get_parent().get_node("Slot2/Item2")
onready var Slot3 = get_parent().get_parent().get_node("Slot3/Item3")
onready var Slot4 = get_parent().get_parent().get_node("Slot4/Item4")

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
	if ItemDatabase.originalOwner != get_focus_owner().name:
		var dropData = get_item_at_position(get_local_mouse_position(), true)
		if ItemDatabase.originalOwner == mainItemList.name:
			mainItemList.removeItem(data[0])
		elif ItemDatabase.originalOwner == Slot1.name:
			Slot1.removeItem(data[0])
		elif ItemDatabase.originalOwner == Slot2.name:
			Slot2.removeItem(data[0])
		elif ItemDatabase.originalOwner == Slot3.name:
			Slot3.removeItem(data[0])
		elif ItemDatabase.originalOwner == Slot4.name:
			Slot4.removeItem(data[0])
		print("DROP DATA: " + str(dropData))
		print("FOCUS OWNER: " +str(get_focus_owner().name))
	addItem(ItemDatabase.heldItem)
	pass

func addItem(key):
	if itemsSlotted == 0:
		if key == 0:
			return
		else:
			var icon = ItemDatabase.ITEMS[str(key)].icon
			add_icon_item(icon, true)
			index = self.get_item_count() - 1
			set_item_tooltip(index, ItemDatabase.ITEMS[str(key)].description)
			set_item_metadata(index, key)
			itemsSlotted += 1
			print("INVTENTORY TOTAL: " + str(itemsSlotted))
	else:
		return
	
func removeItem(key):
	remove_item(key)
	index -= 1
	itemsSlotted -= 1
	print("INVTENTORY TOTAL: " + str(itemsSlotted))
	pass