extends Node






#onready var grid = $ItemContainer
var slotList = Array()
var itemList = Array()
var holdingItem = null


var k
var item = null
var MAX = 28
var loot = Array()
var inventoryTotal = 0


func craft(s1, c1, s2, c2, s3, c3, s4, c4):
	var iArray  = [s1, s2, s3, s4] #array of items
	var cArray = [c1, c2, c3, c4] #array of counts of stacking 
	var lsi; var ssi; var fi; var ki; var sri; var lvi; var wpi; var csi; var bli; var ni #indexes of specific items
	if iArray.contains(12) : #if items incude Wood Planks
		wpi = cArray[iArray.find(12)]
		if iArray.contains(13) : #contains long vines
			lvi = cArray[iArray.find(13)]
			if iArray.contains(16) : #contains banana leaf
				bli = cArray[iArray.find(16)]
				if iArray.contains(14) : #contains large sticks
					lsi = cArray[iArray.find(14)]
					if wpi == 7 && lvi == 7 && bli == 6 && lsi == 5 :
						print("That made....a Water Collector! I can almost taste that clean water already!")
						#drop items
						return 33 #Returns Water Collector
					else:
						print("That made....nothing. What a waste.")
						#drop items
						return 0 #Returns nothing
				elif iArray.contains(0):
					ni = cArray[iArray.find(0)]
					if wpi == 15 && lvi == 8 && bli == 10 && ni == 0 :
						print("That made....a Hut! Oh good, some place safe to sleep!")
						#drop items
						return 32 #Returns Hut
					elif wpi == 1 && lvi == 1 && bli == 1 && ni == 0 :
						print("That made....a Canteen! Nice, water on the go. This will be handy!")
						#drop items
						return 34 #Returns Hut
					else:
						print("That made....nothing. What a waste.")
						#drop items
						return 0 #Returns nothing
					
			elif iArray.contains(28) : #contains clothe square
				csi = cArray[iArray.find(28)] 
				if iArray.contains(11) : # contains small sticks
					ssi = cArray[iArray.find(11)]
					if wpi == 8 && lvi == 5 && csi == 1 && ssi == 4 :
						print("That made....a Raft! Now maybe I can get off this island!")
						#drop items
						return 31 #Returns Raft
					else:
						print("That made....nothing. What a waste.")
						#drop items
						return 0 #Returns nothing
						
				
	elif iArray.contains(14) : # or is if has large Sticks
		lsi = iArray.find(14)
		if iArray.contains(11) : #contains small sticks
			ssi = cArray[iArray.find(11)]
			if iArray.contains(17) : #contains flint
				fi = cArray[iArray.find(17)]
				if iArray.contains(19) : #contains kindling
					ki = cArray[iArray.find(19)]
					if lsi == 3 && ssi == 2 && fi == 1 && ki == 2 :
						print("That made....a Campfire! Now I can cook my food!")
						#drop items
						return 29 #Returns Campfire
					else:
						print("That made....nothing. What a waste.")
						#drop items
						return 0 #Returns nothing
		elif iArray.contains(10): # contains small rock
			sri = cArray[iArray.find(10)]	
			ni = iArray.count(0)
			if ni == 2 :
				if lsi == 1 && sri == 1 && ni == 2 :
						print("That made....a Spear! sweet!")
						#drop items
						return 30 #Returns Spear
				else:
					print("That made....nothing. What a waste.")
						#drop items
					return 0 #Returns nothing
			else:
				print("That made....nothing. What a waste.")
				#drop items
				return 0 #Returns nothing
	else:
		print("That made....nothing. What a waste.")
		#drop items
		return 0 #Returns nothing

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
	itemList.resize(0)
	var numItems = randi()%10
	var id 
	if (numItems + inventoryTotal) > MAX:
		numItems = MAX - inventoryTotal
	for i in range(numItems):
		id = randi()%10
		loot.append(id)



#func _ready():
#	for i in range(28):
#		var slot = ItemSlotClass.new(i)
#		slotList.append(slot)
#		add_child(slot)
#
#
#func _process(delta):
#	if Input.is_action_just_pressed("ui_accept"):
#		if inventoryTotal >= MAX:
#			print("Inventory full")
#		else:
#			createCrate()
#			print(loot.size())
#			print(loot)
#
#	if Input.is_action_just_pressed('ui_select'):
#		k = str(randi()%10)
#		print("I'm eating: " + ItemDatabase.ITEMS[k].name)
#		eat(k)
#
		
			
			
#func _input(event):
#	if holdingItem != null && holdingItem.picked:
#		if event is InputEventMouseMotion:
#			holdingItem.rect_global_position = Vector2(event.position.x, event.position.y);
#