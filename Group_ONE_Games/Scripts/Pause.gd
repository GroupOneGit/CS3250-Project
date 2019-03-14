extends Control

func _input(event):
	
	if Input.is_action_pressed("ui_pause"):
		#This will toggle from True to False as "P" is being pressed
		var moment = not get_tree().paused
		get_tree().paused = moment
		visible = moment

func _on_Menu_pressed():
	get_tree().paused = false
	Global_Player.switch_to("title")


func _on_Restart_pressed():
	get_tree().paused = false
	Global_Player.switch_to("main")


func _on_Quit_pressed():
	Global_Player.switch_to("quit")