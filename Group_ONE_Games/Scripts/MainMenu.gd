extends Control


func _on_NewGameButton_pressed():
	Global_Player.full_health()
	get_tree().change_scene("res://Scenes/DemoLevel.tscn")
