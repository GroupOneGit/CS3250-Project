extends NinePatchRect

func _ready():
	self.hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		if !self.is_visible():
			self.show()
			if ItemDatabase.scrollsFound > 0:
				$ClickInfo.show()
		else:
			self.hide()
			$ClickInfo.hide()
			
func can_drop_data(position, data):
	return true
	
func drop_data(position, data):
	ItemDatabase.holdingItem = false
	ItemDatabase.heldItem = null
	ItemDatabase.originalOwner = null


