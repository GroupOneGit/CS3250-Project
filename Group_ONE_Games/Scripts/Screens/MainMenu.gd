extends Control

func _on_Start_pressed():
	Global_Player.full_health()
	Global_Player.switch_to("main")

func _on_Quit_pressed():
	Global_Player.switch_to("quit")

