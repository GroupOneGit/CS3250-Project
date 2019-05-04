extends Sprite
var itemData = null
onready var mainItemList = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/ItemList")

func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") && mainItemList.get_item_count() < 28:
		mainItemList.addItem(self.itemData)
		queue_free()

func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
