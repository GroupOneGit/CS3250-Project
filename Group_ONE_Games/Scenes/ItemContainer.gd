extends GridContainer
const ItemSlotClass = preload("res://Scripts/ItemSlot.gd")
onready var holdingItem = Global_Inventory.holdingItem
var itemList = Global_Inventory.itemList
var slotList = Global_Inventory.slotList

func _ready():
	for i in range(28):
		var slot = ItemSlotClass.new(i)
		slotList.append(slot)
		add_child(slot)
	Global_Inventory.slotList = slotList
	Global_Inventory.itemList = itemList

func _input(event):
	if holdingItem != null && holdingItem.picked:
		if event is InputEventMouseMotion:
			holdingItem.set_as_toplevel(true)
			holdingItem.rect_global_position = Vector2(event.position.x, event.position.y)

	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed:
		if holdingItem != null:
			delete_item()

	if Input.is_action_just_pressed('ui_pickup'):
		if holdingItem != null:
			var k = str((itemList[itemList.find(holdingItem)].id))
			delete_item()
			print("I'm eating: " + ItemDatabase.ITEMS[k].name)
			Global_Inventory.eat(k)


func _gui_input(event):
	var clickedSlot;
	if event is InputEventMouseButton and event.is_action_pressed('left_click'):
		
		for slot in slotList:
			var slotMousePos = slot.get_local_mouse_position();
			var slotTexture = slot.texture;
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height();
			if isClicked:
				clickedSlot = slot
				

		if clickedSlot == null:
			return
		if holdingItem != null:
			if clickedSlot.item != null:
				holdingItem.set_as_toplevel(false)
				var tempItem = clickedSlot.item;
				var oldSlot = slotList[slotList.find(holdingItem.itemSlot)];
				clickedSlot.pickItem();
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
				oldSlot.putItem(tempItem);
			else:
				holdingItem.set_as_toplevel(false)
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
		elif clickedSlot.item != null:
			holdingItem = clickedSlot.item;
			clickedSlot.pickItem();
			holdingItem.rect_global_position = Vector2(event.position.x + 228 , event.position.y + 123);
			
func _process(delta):
	if Global_Inventory.slotList != slotList:
		Global_Inventory.slotList = slotList
	if Global_Inventory.itemList != itemList:
		Global_Inventory.itemList = itemList
	if Global_Inventory.holdingItem != holdingItem:
		Global_Inventory.holdingItem = holdingItem
	
	
func delete_item():
		if holdingItem != null:
			itemList.erase((itemList[itemList.find(holdingItem)]))
			holdingItem.queue_free()
			Global_Inventory.itemIndex = 0
			Global_Inventory.inventoryTotal -= 1
			holdingItem = null
		else:
			 return
		pass