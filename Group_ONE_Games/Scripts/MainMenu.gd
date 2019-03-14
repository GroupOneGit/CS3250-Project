extends Control


func _on_NewGameButton_pressed():
	Global_Player.full_health()
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
