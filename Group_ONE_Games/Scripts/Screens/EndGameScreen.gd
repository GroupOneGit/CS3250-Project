extends Control

func _on_Yes_pressed():
	Global_Player.full_health()
	Global_Player.switch_to("main")
	pass # Replace with function body.


func _on_No_pressed():
	Global_Player.full_health()
	Global_Player.switch_to("title")
	pass # Replace with function body.
