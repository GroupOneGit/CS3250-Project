extends Control


func _on_TryAgain_pressed():
	#This funtion uses the export variable from the Global.Player script to go to the demo level
	get_tree().change_scene_to(Global_Player.level_scene)


func _on_Nope_pressed():
	#This funtion uses the export variable from the Global.Player script to go to the end screen
	get_tree().change_scene_to(Global_Player.title_scene)
