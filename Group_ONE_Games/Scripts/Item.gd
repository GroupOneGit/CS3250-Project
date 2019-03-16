extends TextureRect

var itemIcon
var itemName
var itemSlot
var id
var picked = false

func _init(itemName, itemTexture, itemSlot, itemDescription, itemID):
	name = itemName
	self.itemName = itemName
	texture = itemTexture
	id = itemID
	rect_scale = (Vector2(0.75,0.75))
	rect_position = Vector2(7,6)
	self.itemSlot = itemSlot
	hint_tooltip = "Name: %s \n\nDescription: %s" % [itemName, itemDescription]
	mouse_filter = Control.MOUSE_FILTER_PASS
	mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


func pickItem():
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	picked = true
	pass
	
func putItem():
	print(str(get_rect()))
	rect_global_position = Vector2(229,124)
	mouse_filter = Control.MOUSE_FILTER_PASS
	picked = false
	pass
	
