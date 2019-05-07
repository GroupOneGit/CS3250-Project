extends Control

func _on_Yes_pressed():
	Global_Player.full_health()
	Global_Player.has_Hat = false
	ItemDatabase.restart()
	for i in range(1,9):
		ItemDatabase.scroll[i].hasfound = false
	Global_Player.switch_to("main")
	pass # Replace with function body.


func _on_No_pressed():
	Global_Player.full_health()
	Global_Player.switch_to("title")
	pass # Replace with function body.
