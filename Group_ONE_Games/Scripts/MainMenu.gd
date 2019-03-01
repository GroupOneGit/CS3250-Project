extends Control


func _on_NewGameButton_pressed():
	Global_Player.full_life()
	get_tree().change_scene_to(Global_Player.level_scene)

func _on_QuitButton_pressed():
	get_tree().quit()
