extends Control

var main_scene = preload("res://DemoLevel.tscn")
var title_scene = preload("res://Scenes/MainMenu.tscn")

func _on_TryAgain_pressed():
	Global_Player.health = Global_Player.MAX_health
	get_tree().change_scene_to(main_scene)


func _on_Nope_pressed():
	Global_Player.health = Global_Player.MAX_health
	get_tree().change_scene_to(title_scene)
