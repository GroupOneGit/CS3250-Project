extends Control

func _on_Start_pressed():
	Global_Player.full_health()
	Global_Player.has_Hat = false
	ItemDatabase.scrollsFound = 0
	ItemDatabase.scrollPage = 1
	ItemDatabase.restart()
	for i in range(1,9):
		ItemDatabase.scroll[i].hasfound = false
	Global_Player.switch_to("main")

func _on_Quit_pressed():
	Global_Player.switch_to("quit")

