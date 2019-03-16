extends HBoxContainer

const ItemClass = preload("res://Scripts/Item.gd")
const ItemSlotClass = preload("res://Scripts/ItemSlot.gd")
const slot_texture = preload("res://Art/GUI-ART/Inventory/InventorySlot.png")

var mainSlotList = Array()
var holdingItem = Global_Inventory.holdingItem


func _ready():
	for i in range(4):
		var slot = ItemSlotClass.new(i)
		mainSlotList.append(slot)
		add_child(slot)

	

func _input(event):
	if holdingItem != null && holdingItem.picked:
		if event is InputEventMouseMotion:
			holdingItem.rect_global_position = Vector2(event.position.x, event.position.y);


func _gui_input(event):
	var clickedSlot;
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		
		for slot in mainSlotList:
			var slotMousePos = slot.get_local_mouse_position();
			var slotTexture = slot.texture;
			var isClicked = slotMousePos.x >= 0 && slotMousePos.x <= slotTexture.get_width() && slotMousePos.y >= 0 && slotMousePos.y <= slotTexture.get_height();
			if isClicked:
				clickedSlot = slot;

		if clickedSlot == null:
			return
			
		if holdingItem != null:
			if clickedSlot.item != null:
				var tempItem = clickedSlot.item;
				var oldSlot = mainSlotList[mainSlotList.find(holdingItem.itemSlot)];
				clickedSlot.pickItem();
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
				oldSlot.putItem(tempItem);
			else:
				clickedSlot.putItem(holdingItem);
				holdingItem = null;
		elif clickedSlot.item != null:
			holdingItem = clickedSlot.item;
			clickedSlot.pickItem();
			holdingItem.rect_global_position = Vector2(event.position.x + 215, event.position.y + 141);
			
		
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed:
		if holdingItem != null:
#			holdingItem.dropItem()
			holdingItem.queue_free()
			holdingItem = null
			print("gonna drop it")
		else:
			 return
		
		pass
		
