extends Control

func _on_Start_pressed():
	Global_Player.full_health()
	ItemDatabase.restart()
	for i in range(1,9):
		ItemDatabase.scroll[i].hasfound = false
	Global_Player.switch_to("main")

func _on_Quit_pressed():
	Global_Player.switch_to("quit")

