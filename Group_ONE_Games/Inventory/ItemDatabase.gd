extends Node

const PATH = null
const itemImages = [ 
	preload("res://Art/Item_TEMP_Art/Item0.png"),
	preload("res://Art/Item_TEMP_Art/Item1.png"),
	preload("res://Art/Item_TEMP_Art/Item2.png"),
	preload("res://Art/Item_TEMP_Art/Item3.png"),
	preload("res://Art/Item_TEMP_Art/Item4.png"),
	preload("res://Art/Item_TEMP_Art/Item5.png"),
	preload("res://Art/Item_TEMP_Art/Item6.png"),
	preload("res://Art/Item_TEMP_Art/Item7.png"),
	preload("res://Art/Item_TEMP_Art/Item8.png"),
	preload("res://Art/Item_TEMP_Art/Item9.png"),
]
var ITEMS = {

	#Nothing! Ha!

	"0" : {
		 name = "Nothing",
		 icon = itemImages[0],
		 description = "Nothing",
		 itemHealth = 0,
		 dph = 0,
		 edible = false,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = false,
		 effects = null,
		 thirstEffect = 0 ,
		 healthEffect = 0
	},

	#Common Consumables

	"1" : {
		 name = "Blue Berries",
		 icon = itemImages[1],
		 description = "A cluster of small blue berries. Look tasty!",
		 itemHealth = 50,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = true,
		 effects = "dehydration",
<<<<<<< refs/remotes/origin/KaylaPC
		 thirstEffect = 5,
=======
		 thirstEffect = 25,
>>>>>>> Inventory fixes
		 healthEffect = 5
	},

	"2" : {
		 name = "Red Berries",
		 icon = itemImages[2],
		 description = "A cluster of small red berries. Yum!",
		 itemHealth = 50,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = true,
		 effects = "dehydration",
		 thirstEffect = 5,
		 healthEffect = 5
	},

	"3" : {
		 name = "Weak Antidote",
		 icon = itemImages[3],
		 description = "A weak antidote to cure poison and replenish health",
		 itemHealth = 100,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = false,
		 effects = "antidote",
		 thirstEffect = 0,
		 healthEffect = 50
	},

	"4" : {
		 name = "Coconut",
		 icon = itemImages[4],
		 description = "A small round throwable and edible fruit.",
		 itemHealth = 100,
		 dph = 5,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = true,
		 effects = null,
		 thirstEffect = 0,
		 healthEffect = 5
	},

	"5" : {
		 name = "Raw Crab Meat",
		 icon = itemImages[5],
		 description = "Raw meat harvested from crabs.",
		 itemHealth = 25,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = true,
		 stackable = true,
		 effects = "poison",
		 thirstEffect = 0,
		 healthEffect = 5
	},

	"6" : {
		 name = "Raw Fish Meat",
		 icon = itemImages[6],
		 description = "Raw meat harvested from fish.",
		 itemHealth = 25,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = true,
		 stackable = true,
		 effects = "poison",
		 thirstEffect = 0,
		 healthEffect = 5
	},

	"7" : {
		 name = "Banana",
		 icon = itemImages[9],
		 description = "A delicious easy to get fruit.",
		 itemHealth = 50,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = true,
		 effects = null,
		 thirstEffect = 0,
		 healthEffect = 5
	},

	"8" : {
		 name = "Raw Clam Meat",
		 icon = itemImages[5],
		 description = "Raw meat harvested from clams.",
		 itemHealth = 25,
		 dph = 0,
		 edible = true,
		 questItem = false,
		 repairable = false,
		 cookable = true,
		 stackable = true,
		 effects = "poison",
		 thirstEffect = 0,
		 healthEffect = 5
	},

	#Common Supplies
	"9" : {
		 name = "Nothing",
		 icon = itemImages[0],
		 description = "Nothing",
		 itemHealth = 0,
		 dph = 0,
		 edible = false,
		 questItem = false,
		 repairable = false,
		 cookable = false,
		 stackable = false,
		 effects = null,
		 thirstEffect = 0 ,
		 healthEffect = 0
	},

#	"10" : {
#		 name = "Small Rock",
#		 icon = PATH, 
#		 description = "Small rocks that can by thrown or used for crafting.",
#		 itemHealth = null,
#		 dph = 5,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"11" : {
#		 name = "Small Stick",
#		 icon = PATH, 
#		 description = "Small sticks used for crafting.",
#		 itemHealth = null,
#		 dph = 5,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"12" : {
#		 name = "Wood Plank",
#		 icon = PATH,
#		 description = "Wood planks used for crafting.",
#		 itemHealth = null,
#		 dph = 15,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"13" : {
#		 name = "Long Vine",
#		 icon = PATH, 
#		 description = "Long tiable vines used for crafting.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"14" : {
#		 name = "Large Stick",
#		 icon = PATH, 
#		 description = "Large stick used for crafting",
#		 itemHealth = null,
#		 dph = 10,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"15" : {
#		 name = "Large Rock",
#		 icon = PATH, 
#		 description = "Large rock used for crafting.",
#		 itemHealth = null,
#		 dph = 25,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"16" : {
#		 name = "Banana Leaf",
#		 icon = PATH,
#		 description = "Large leaf used for crafting.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"17" : {
#		 name = "Flint",
#		 icon = PATH, 
#		 description = "A mineral used to create fire.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"18" : {
#		 name = "Ripped Cloth",
#		 icon = PATH,
#		 description = "A large square of cloth ripped in the middle.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"19" : {
#		 name = "Kindling",
#		 icon = PATH,
#		 description = "A small collection of sticks used to start fires.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	#Rare Consumables
#
#	"20" : {
#		 name = "Strong Antidote",
#		 icon = PATH,
#		 description = "A strong antidote that cures poison and refills all bars.",
#		 itemHealth = 100,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "Stat Reset",
#		 thirstEffect = 100,
#		 healthEffect = 100
#	},
#
#	"21" : {
#		 name = "Gold Berries",
#		 icon = PATH,
#		 description = "A delicious cluster of gold berries.",
#		 itemHealth = 50,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Strength Bonus",
#		 thirstEffect = 1,
#		 healthEffect = 15
#	},
#
#	"22" : {
#		 name = "Raw Enemy Meat Slot",
#		 icon = PATH,
#		 description = "Raw meat harvested from ENEMY.",
#		 itemHealth = 25,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = true,
#		 stackable = true,
#		 effects = "poison",
#		 thirstEffect = 0,
#		 healthEffect = 5
#	},
#
#	"23" : {
#		 name = "Raw Enemy Meat Slot",
#		 icon = PATH,
#		 description = "Raw meat harvested from ENEMY.",
#		 itemHealth = 25,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = true,
#		 stackable = true,
#		 effects = "poison",
#		 thirstEffect = 0,
#		 healthEffect = 5
#	},
#
#	"24" : {
#		 name = "Raw Enemy Meat Slot",
#		 icon = PATH,
#		 description = "Raw meat harvested from ENEMY.",
#		 itemHealth = 25,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = true,
#		 stackable = true,
#		 effects = "poison",
#		 thirstEffect = 0,
#		 healthEffect = 5
#	},
#
#	"25" : {
#		 name = "Raw Enemy Meat Slot",
#		 icon = PATH,
#		 description = "Raw meat harvested from ENEMY.",
#		 itemHealth = 25,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = true,
#		 stackable = true,
#		 effects = "poison",
#		 thirstEffect = 0,
#		 healthEffect = 5
#	},
#
#	#Rare Sunpplies
#
#	"26" : {
#		 name = "Sword",
#		 icon = PATH,
#		 description = "A sharp metal stick used for combat.",
#		 itemHealth = 100,
#		 dph = 30,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"27" : {
#		 name = "Dagger",
#		 icon = PATH,
#		 description = "A small sharp metal stick used for combat.",
#		 itemHealth =100,
#		 dph = 25,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"28" : {
#		 name = "Clothe Square",
#		 icon = PATH,
#		 description = "A prestine large clothe square, ideal for sails.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	#Crafted Items
#
#	"29" : {
#		 name = "Campfire",
#		 icon = PATH,
#		 description = "A campfire used for cooking items; made with 3 large sticks, 2 small sticks, 1 flint, and 2 kindling",
#		 itemHealth = 100,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"30" : {
#		 name = "Spear",
#		 icon = PATH,
#		 description = "A weapon used in combat or fishing; made with 1 large stick and small rock.",
#		 itemHealth = 50,
#		 dph = 20,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"31" : {
#		 name = "Raft",
#		 icon = PATH,
#		 description = "A raft for escaping; made from 8 wooden planks, 5 long vines, 1 clothe square, and 4 small sticks.",
#		 itemHealth = 100,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"32" : {
#		 name = "Hut",
#		 icon = PATH,
#		 description = "A shelter from rain and animals; made with 15 wooden planks, 10 banana leaves, and 8 long vines.",
#		 itemHealth = 100,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"33" : {
#		 name = "Water Collector",
#		 icon = PATH ,
#		 description = "A rain water collection system; made with 7 wooden plankes, 6 banana leaves, 5 large sticks, and 7 long vines.",
#		 itemHealth = 100,
#		 dph = 0,
#		 edible = false,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"34" : {
#		 name = "Canteen",
#		 icon = PATH + "",
#		 description = "A portable container for water; made with 1 wooden plank, 1 long vine, and 1 banana leaf.",
#		 itemHealth = 100,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = true,
#		 cookable = false,
#		 stackable = false,
#		 effects = null,
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	#Quest Items
#
#	"35" : {
#		 name = "Mysterious Journal",
#		 icon = PATH + "",
#		 description = "A mysterious journal with pages ripped out.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"36" : {
#		 name = "Ripped Page 1",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"37" : {
#		 name = "Ripped Page 2",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"38" : {
#		 name = "Ripped Page 3",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"39" : {
#		 name = "Ripped Page 4",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"40" : {
#		 name = "Ripped Page 5",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"41" : {
#		 name = "Ripped Page 6",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"42" : {
#		 name = "Ripped Page 7",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"43" : {
#		 name = "Ripped Page 8",
#		 icon = PATH + "",
#		 description = "A ripped page with writing",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"44" : {
#		 name = "Mysterious Artifact",
#		 icon = PATH + "",
#		 description = "A A mysterious artifact that may be used for something.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	"45" : {
#		 name = "SOS Beacon",
#		 icon = PATH + "",
#		 description = "A beacon calling for help.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = false,
#		 questItem = true,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "key",
#		 thirstEffect = 0,
#		 healthEffect = 0
#	},
#
#	#Cooked Items
#
#	"46" : {
#		 name = "Cooked Crab Meat",
#		 icon = PATH + "",
#		 description = "Cooked crab meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 25
#	},
#
#	"47" : {
#		 name = "Cooked Clam Meat",
#		 icon = PATH + "",
#		 description = "Cooked clam meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 25
#	},
#
#	"48" : {
#		 name = "Cooked Fish Meat",
#		 icon = PATH + "",
#		 description = "Cooked fish meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 25
#	},
#
#	"49" : {
#		 name = "Cooked ENEMY Meat Slot",
#		 icon = PATH + "",
#		 description = "Cooked ENEMY Meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 30
#	},
#
#	"50" : {
#		 name = "Cooked ENEMY Meat Slot",
#		 icon = PATH + "",
#		 description = "Cooked ENEMY Meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 30
#	},
#
#	"51" : {
#		 name = "Cooked ENEMY Meat Slot",
#		 icon = PATH + "",
#		 description = "Cooked ENEMY Meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 30
#	},
#
#	"52" : {
#		 name = "Cooked ENEMY Meat Slot",
#		 icon = PATH + "",
#		 description = "Cooked ENEMY Meat.",
#		 itemHealth = 75,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Health Bonus",
#		 thirstEffect = 0,
#		 healthEffect = 30
#	},
#
#	#Water
#
#	"53" : {
#		 name = "Sea Water",
#		 icon = PATH + "",
#		 description = "Salty water.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "dehydration",
#		 thirstEffect = -15,
#		 healthEffect = 0
#	},
#
#	"54" : {
#		 name = "Stream Water",
#		 icon = PATH + "",
#		 description = "Fresh but dirty water.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "poison",
#		 thirstEffect = -5,
#		 healthEffect = 5
#	},
#
#	"55" : {
#		 name = "Purified Water",
#		 icon = PATH + "",
#		 description = "Clean water",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Thirst Quench",
#		 thirstEffect = 0,
#		 healthEffect = 25
#	},
#
#	"56" : {
#		 name = "Rain Water",
#		 icon = PATH + "",
#		 description = "Clean water",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = true,
#		 effects = "Thirst Quench",
#		 thirstEffect = 0,
#		 healthEffect = 25
#	},
#
#	"57" : {
#		 name = "Spoiled Meat",
#		 icon = PATH + "",
#		 description = "A heap of spoiled meat.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "poison",
#		 thirstEffect = 0,
#		 healthEffect = 10
#	},
#
#	"58" : {
#		 name = "Spoiled Mush",
#		 icon = PATH + "",
#		 description = "A heap of spoiled food, you can't even tell what it is was.",
#		 itemHealth = null,
#		 dph = 0,
#		 edible = true,
#		 questItem = false,
#		 repairable = false,
#		 cookable = false,
#		 stackable = false,
#		 effects = "poison",
#		 thirstEffect = 0,
#		 healthEffect = 10
#	}
#
}



func item(id):
	if id in ITEMS:
	 	return ITEMS[id]
	else:
	 	return ITEMS["0"]

func name(id):
	if id in ITEMS:
 		return ITEMS[id].name
	else:
 		return ITEMS["0"].name

func icon(id):
	if id in ITEMS:
 		return ITEMS[id].icon
	else:
 		return ITEMS["0"].icon

func health(id):
	if id in ITEMS:
 		return ITEMS[id].itemHealth
	else:
 		return ITEMS["0"].itemHealth

func health_restored(id):
	if id in ITEMS:
 		return ITEMS[id].healthEffect
	else:
 		return ITEMS["0"].healthEffect

func water_restored(id):
	if id in ITEMS:
 		return ITEMS[id].thirstEffect
	else:
 		return ITEMS["0"].thirstEffect

func isRepairable(id):
	if id in ITEMS:
 		return ITEMS[id].repairable
	else:
 		return false

func dph(id):
	if id in ITEMS:
 		return ITEMS[id].dph
	else:
 		return ITEMS["0"].dp

func side_effects(id):
	if id in ITEMS:
 		return ITEMS[id].effects
	else:
 		return ITEMS["0"].effects

func thirstEffect(id):
	if id in ITEMS:
 		return ITEMS[id].thirstEffect
	else:
 		return ITEMS["0"].thirstEffect
		
func healthEffect(id):
	if id in ITEMS:
 		return ITEMS[id].healthEffect
	else:
 		return ITEMS["0"].healthEffect
		
func isEdible(id):
	if id in ITEMS:
 		return ITEMS[id].edible
	else:
 		return false

func isCookable(id):
	if id in ITEMS:
 		return ITEMS[id].cookable
	else:
 		return false

func description(id):
	if id in ITEMS:
		return ITEMS[id].description
	else:
		 return ITEMS["0"].description

func stats(id):
	var stats = ("Item: " + ITEMS[id].name + " Description: " + ITEMS[id].description + " Health: " + str(ITEMS[id].health) + " Abilities: " + ITEMS[id].abilities)
	return stats


