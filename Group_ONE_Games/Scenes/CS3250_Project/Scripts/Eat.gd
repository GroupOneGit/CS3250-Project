extends Area2D

func _on_Area2D_area_entered(area):
	if Input.is_action_just_pressed("ui_select"):
		Global_Player.gain_health(5)
		print("Yum!")
