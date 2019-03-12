extends TextureRect

var itemIcon
var itemName
var itemSlot
var picked = false

func _init(itemName, itemTexture, itemSlot, itemDescription):
	name = itemName
	self.itemName = itemName
	texture = itemTexture
	self.itemSlot = itemSlot
	hint_tooltip = "Name: %s \n\nDescription: %s" % [itemName, itemDescription]
	mouse_filter = Control.MOUSE_FILTER_PASS
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


func pickItem():
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	picked = true
	pass
	
func putItem():
	rect_global_position = Vector2(214,140)
	mouse_filter = Control.MOUSE_FILTER_PASS
	picked = false
	pass
	
