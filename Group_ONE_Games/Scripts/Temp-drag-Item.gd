extends TextureRect
onready var itemImage = preload("res://Art/Food/Apple.png")
onready var label = $Label
var tempText
var itemSlots = Array()

onready var mainItemList = get_parent().get_parent().get_parent().get_parent().get_node("Dropdown/ItemList")


func _ready():
	pass

func get_drag_data(pos):
	var dragIcon = TextureRect.new()
	var forReturn = PoolIntArray()
	if self.name.length() < 2:
		dragIcon.texture = ItemDatabase.ITEMS[self.name].icon
	else:
		return
	ItemDatabase.heldItem = int(self.name)
	forReturn.append(int(self.name))
	set_drag_preview(dragIcon)
	ItemDatabase.originalOwner = get_focus_owner().name
	removeItem()
	return forReturn
	pass
	
func can_drop_data(position, data):
	print("can drop")
	set_focus_mode(Control.FOCUS_ALL)
	grab_focus()
	return true
	
func drop_data(position, data):
	if ItemDatabase.originalOwner == "ItemList":
		mainItemList.removeItem(data[0])
		addItem()
	if ItemDatabase.originalOwner == get_focus_owner().name:
		print("fuck")
		return
	else:
		removeItem()
		addItem()
	ItemDatabase.heldItem = null


	pass


func addItem():
	self.texture = ItemDatabase.ITEMS[str(ItemDatabase.heldItem)].icon
	self.name = str(ItemDatabase.heldItem)
	self.rect_scale = Vector2(0.75,0.75)
	stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	
func removeItem():
	self.texture = null
	var tempName = get_parent().name
	self.name = "Item" + tempName.right(4)
	print(self.name)
	
func swapItems():
	pass
	