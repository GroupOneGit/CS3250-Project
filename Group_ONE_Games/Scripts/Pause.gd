extends Control

func _input(event):
	
	if Input.is_action_pressed("ui_pause"):
		var moment = not get_tree().paused
		get_tree().paused = moment
		visible = moment

func _on_Exit_pressed():
	get_tree().quit()
