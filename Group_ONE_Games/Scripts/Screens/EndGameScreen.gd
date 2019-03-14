extends Control


func _on_TryAgain_pressed():
	Global_Player.full_health()
	Global_Player.switch_to("main")


func _on_Nope_pressed():
	Global_Player.full_health()
	Global_Player.switch_to("title")
