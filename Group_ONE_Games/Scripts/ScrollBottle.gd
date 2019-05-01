extends Node2D

var inArea = false
var inSoundArea = false
onready var scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/Scroll1")
onready var scrollIMG = preload("res://Art/Items/Bottle_Message.png")
onready var scrollLabel = get_node("Z_Index/Label")
onready var popUpScrollScene = preload("res://Scenes/PopUpScroll.tscn")
onready var demoLevel = get_node("/root/DemoLevel")
onready var popUpScroll = popUpScrollScene.instance()

var scrollText = {
	
	1: {
		text = "This is the text for Scroll 1, Keep finding dem scrolls!"
	},
	
	2: {
		text = "This is the text for Scroll 2, KEep ON NOW YA HEAR!"
	},
	3: {
		text = "This is the text for Scroll 3"
	},
	4: {
		text = "This is the text for Scroll 4"
	},
	5: {
		text = "This is the text for Scroll 5"
	},
	6: {
		text = "This is the text for Scroll 6"
	},
	7: {
		text = "This is the text for Scroll 7"
	},
	8: {
		text = "This is the text for Scroll 8, ALMOST THERE!"
	}
}

func _on_InteractArea_body_entered(body):
	if body.is_in_group("Player"):
		inArea = true
		scrollLabel.show()

			

func _on_InteractArea_body_exited(body):
	if body.is_in_group("Player"):
		inArea = false
		scrollLabel.hide()


func _input(event):
	if event.is_action_pressed("ui_interact") && inArea == true:
		match self.name:
			"Scroll1":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("1")
				print(scrollText[1].text)
				show_scroll(scrollText[1].text)
				#Do stuff if scroll picked up is Scroll1
			"Scroll2":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("2")
				show_scroll(scrollText[2].text)
				#Do stuff if scroll picked up is Scroll2
			"Scroll3":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("3")
				show_scroll(scrollText[3].text)
				#Do stuff if scroll picked up is Scroll3
			"Scroll4":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_TOP/" + str(self.name))
				print("4")
				show_scroll(scrollText[4].text)
				#Do stuff if scroll picked up is Scroll4
			"Scroll5":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_MID/" + str(self.name))
				print("5")
				show_scroll(scrollText[5].text)
				#Do stuff if scroll picked up is Scroll5
			"Scroll6":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_MID/" + str(self.name))
				print("6")
				show_scroll(scrollText[6].text)
				#Do stuff if scroll picked up is Scroll6
			"Scroll7":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_MID/" + str(self.name))
				print("7")
				show_scroll(scrollText[7].text)
				#Do stuff if scroll picked up is Scroll7
			"Scroll8":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_BOT/" + str(self.name))
				print("8")
				show_scroll(scrollText[8].text)
				#Do stuff if scroll picked up is Scroll8
			"Scroll9":
				scrollOnShelf = get_node("/root/DemoLevel/CanvasLayer/GUI/Dropdown/Shelf_BOT/" + str(self.name))
				print("9")
				
		queue_free()
		scrollOnShelf.texture = scrollIMG
		AudioServer.set_bus_mute(1, true)


func _on_SoundArea_body_entered(body):
	if body.is_in_group("Player"):
		print("playing")
		AudioServer.set_bus_mute(1, false)
		$AudioStreamPlayer2D.play(0.90)

func _on_SoundArea_body_exited(body):
	if body.is_in_group("Player"):
		$AudioStreamPlayer2D.stop()


func show_scroll(text):
	var popUpText = popUpScroll.get_node("CanvasLayer/Texture/TextLabel")
	popUpText.text = text
	get_tree().paused = true
	demoLevel.add_child(popUpScroll)
	popUpScroll.show()


