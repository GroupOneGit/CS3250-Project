extends Sprite
var itemData = null
onready var mainItemList = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/ItemList")

func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	print(body.name)
	if body.is_in_group("Player"):
		mainItemList.addItem(self.itemData)
		queue_free()