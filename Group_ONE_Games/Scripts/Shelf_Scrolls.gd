extends TextureRect
onready var popUpScrollScene = preload("res://Scenes/PopUpScroll.tscn")
onready var popUpScroll = popUpScrollScene.instance()
onready var demoLevel = get_node("/root/DemoLevel")
onready var scroll = get_node("/root/DemoLevel/Scrolls/Scroll1")
var mouseIn1 = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



#func _on_Area2D_input_event(viewport, event, shape_idx):
#	print(event)
#	if event.is_action_pressed("ui_LMB"):
#		print("SHOWING SCROLL")
#		show_scroll(scroll.scroll_text[1])
#	pass # Replace with function body.
#
#
#func _on_Area2D_mouse_entered():
#	mouseIn1 = true
#	print("mouse in")
#	pass # Replace with function body.





func show_scroll(text):
	var popUpScroll = popUpScrollScene.instance()
	var popUpText = popUpScroll.get_node("CanvasLayer/Texture/TextLabel")
	popUpText.text = text
	get_tree().paused = true
	demoLevel.add_child(popUpScroll)
	popUpScroll.show()


func _on_Scroll1_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[1].hasFound == true:
		show_scroll(ItemDatabase.scroll[1].text)
	pass # Replace with function body.

func _on_Scroll2_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[2].hasFound == true:
		show_scroll(ItemDatabase.scroll[2].text)
	pass # Replace with function body.


func _on_Scroll3_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[3].hasFound == true:
		show_scroll(ItemDatabase.scroll[3].text)
	pass # Replace with function body.


func _on_Scroll4_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[4].hasFound == true:
		show_scroll(ItemDatabase.scroll[4].text)
	pass # Replace with function body.


func _on_Scroll5_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[5].hasFound == true:
		show_scroll(ItemDatabase.scroll[5].text)
	pass # Replace with function body.


func _on_Scroll6_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[6].hasFound == true:
		show_scroll(ItemDatabase.scroll[6].text)
	pass # Replace with function body.


func _on_Scroll7_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[7].hasFound == true:
		show_scroll(ItemDatabase.scroll[7].text)
	pass # Replace with function body.


func _on_Scroll8_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[8].hasFound == true:
		show_scroll(ItemDatabase.scroll[8].text)
	pass # Replace with function body.


func _on_Scroll9_gui_input(event):
	if event.is_action_pressed("ui_LMB") && ItemDatabase.scroll[9].hasFound == true:
		show_scroll(ItemDatabase.scroll[9].text)
	pass # Replace with function body.



