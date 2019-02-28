extends TextureRect
onready var itemImage = preload("res://Art/Food/Apple.png")
onready var label = $Label
var tempText
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_drag_data(pos):
	var drag_img = TextureRect.new()
	drag_img.texture = itemImage
	set_drag_preview(drag_img)
	self.texture = null
	label.text = ''
	print('can drag')
	return drag_img.texture
	
	
func can_drop_data(position, data):
	#print (data)
	return typeof(data) == TYPE_OBJECT
	if typeof(data) == TYPE_OBJECT:
		print('can drop')
	
func drop_data(position, data):
	self.texture = data
	label.text = '99'