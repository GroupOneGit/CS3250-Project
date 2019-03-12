extends TextureRect

onready var itemscence = preload("res://Scenes/temp-Item.tscn")
var slotIndex
var item = null

func _init(slotIndex):
	self.slotIndex = slotIndex
	name = "ItemSlot_%d" % slotIndex
	texture = preload("res://Art/GUI-ART/Inventory/InventorySlot_transparent.png")
	mouse_filter = Control.MOUSE_FILTER_PASS
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func setItem(newItem):
	add_child(newItem)
	item = newItem
	item.itemSlot = self
	pass

func pickItem():
	item.pickItem()
	remove_child(item)
	get_parent().get_parent().add_child(item)
	item = null;

func putItem(newItem):
	item = newItem
	item.itemSlot = self
	item.putItem()
	get_parent().get_parent().remove_child(item)
	add_child(item)
	
func dropItem(item):
	get_parent().get_parent().get_child(item).queue_free()
#	self.queue_free()
	item = null
	
	pass