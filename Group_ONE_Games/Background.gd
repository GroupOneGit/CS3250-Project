extends NinePatchRect

func _ready():
	pass

func can_drop_data(position, data):
	print("true")
	return true
	
func drop_data(position, data):
	ItemDatabase.holdingItem = false
	ItemDatabase.heldItem = null