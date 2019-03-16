extends GridContainer

const ItemClass = preload("res://Scripts/Item.gd")
const slot_texture = preload("res://Art/GUI-ART/Inventory/InventorySlot.png")

onready var item_img = preload("res://Scenes/temp-Item.tscn")


<<<<<<< refs/remotes/origin/KaylaPC
=======
var holdingItem 
var itemIndex = 0
>>>>>>> Inventory fixes
var k
var item = null
var MAX = 28
var loot = Array()
var inventoryTotal = 0
onready var slotList = Array()
onready var itemList = Array() 


func eat(id):
	print("got to eat")
	print(id)
	
	if (ItemDatabase.ITEMS[str(id)].edible):
		Global_Player.gain_health(ItemDatabase.ITEMS[str(id)].healthEffect)
		match ItemDatabase.ITEMS[str(id)].effects:
			"poison":
				print("I shouldn't have eaten that...")
				Global_Player.setP(true)
				#ItemSlotClass.dropItem(id)
			"dehydration":
				print("Yum, slightly thirstier.")
				Global_Player.lose_thirst(ItemDatabase.ITEMS[str(id)].thirstEffect)
				#ItemSlotClass.dropItem(id)
			"Thirst Quench":
				print("Great! I feel refreshed!")
				Global_Player.gain_thirst(ItemDatabase.ITEMS[str(id)].thirstEffect)
				#ItemSlotClass.dropItem(id)
			"Health Bonus":
				print("Yum, I feel stronger")
				Global_Player.gain_health(ItemDatabase.ITEMS[str(id)].healthEffect)
				#ItemSlotClass.dropItem(id)
			"Strength Bonus":
				print("Yum, I feel stronger")
				#ItemSlotClass.dropItem(id)
			"Stat Reset":
				print("Yum, I feel fantastic!")
				Global_Player.Full_Health()
				#ItemSlotClass.dropItem(id)
			"antidote":
				print("Oh good, I'm not sick now.")
				Global_Player.setP(false)
				#ItemSlotClass.dropItem(id)
			_: 
				print("Hmmm. Interesting.")
				#ItemSlotClass.dropItem(id)
			
	else:
		print("That's not edible.")
		

func eat(id):
	print("got to eat")
	print(id)
	
	if (ItemDatabase.ITEMS[str(id)].edible):
		Global_Player.gain_health(ItemDatabase.ITEMS[str(id)].healthEffect)
		match ItemDatabase.ITEMS[str(id)].effects:
			"poison":
				print("I shouldn't have eaten that...")
				Global_Player.setP(true)
				#ItemSlotClass.dropItem(id)
			"dehydration":
				print("Yum, slightly thirstier.")
				Global_Player.lose_thirst(ItemDatabase.ITEMS[str(id)].thirstEffect)
				#ItemSlotClass.dropItem(id)
			"Thirst Quench":
				print("Great! I feel refreshed!")
				Global_Player.gain_thirst(ItemDatabase.ITEMS[str(id)].thirstEffect)
				#ItemSlotClass.dropItem(id)
			"Health Bonus":
				print("Yum, I feel stronger")
				Global_Player.gain_health(ItemDatabase.ITEMS[str(id)].healthEffect)
				#ItemSlotClass.dropItem(id)
			"Strength Bonus":
				print("Yum, I feel stronger")
				#ItemSlotClass.dropItem(id)
			"Stat Reset":
				print("Yum, I feel fantastic!")
				Global_Player.Full_Health()
				#ItemSlotClass.dropItem(id)
			"antidote":
				print("Oh good, I'm not sick now.")
				Global_Player.setP(false)
				#ItemSlotClass.dropItem(id)
			_: 
				print("Hmmm. Interesting.")
				#ItemSlotClass.dropItem(id)
			
	else:
		print("That's not edible.")
		

func createCrate():
	loot.resize(0)
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

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if inventoryTotal >= MAX:
			print("Inventory full")
		else:
			print('itemList size: ' + str(itemList.size()))
			print('slotList size: ' + str(slotList.size()))
			createCrate()
			populateInv()
			print(loot.size())
			print(loot)
<<<<<<< refs/remotes/origin/KaylaPC
			
	if Input.is_action_just_pressed('ui_select'):
		k = str(randi()%10)
		print("I'm eating: " + ItemDatabase.ITEMS[k].name)
		eat(k)
		
		
			
			
func _input(event):
	if holdingItem != null && holdingItem.picked:
		if event is InputEventMouseMotion:
			holdingItem.rect_global_position = Vector2(event.position.x, event.position.y);
=======
>>>>>>> Inventory fixes



func populateInv():
	if holdingItem == null:
		for item in loot:
				var itemName = ItemDatabase.ITEMS[str(item)].name
				var itemIcon = ItemDatabase.ITEMS[str(item)].icon
				var itemDescription = ItemDatabase.ITEMS[str(item)].description
				var itemID = item
				itemList.append(ItemClass.new(itemName, itemIcon, null, itemDescription, itemID))
				
		for i in range(itemIndex, itemList.size()):
			for j in range(slotList.size()):
				if itemList[i].get_parent() == null:
					if slotList[j].get_child_count() == 0:
						slotList[j].setItem(itemList[i])
						itemIndex = itemList.size() 
						inventoryTotal += 1
					else: pass
				else: pass
	else:
		return

func deleteInv():
	itemList.resize(0)
	slotList.resize(0)
	inventoryTotal = 0
	itemIndex = 0