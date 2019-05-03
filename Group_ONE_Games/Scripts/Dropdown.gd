extends NinePatchRect

func _ready():
	self.hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		if !self.is_visible():
			self.show()
		else:
			self.hide()
			
func can_drop_data(position, data):
	return true
	
func drop_data(position, data):
	ItemDatabase.holdingItem = false
	ItemDatabase.heldItem = null
	ItemDatabase.originalOwner = null