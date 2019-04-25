extends Control
func _ready():
	visible = false
	
func _input(event):
	
	if Input.is_action_pressed("ui_pause"):
		#This will toggle from True to False as "P" is being pressed
		var moment = not get_tree().paused
		get_tree().paused = moment
		visible = moment
	if Input.is_action_pressed("ui_restart"):
		stop_p()
		Global_Player.full_health()
		Global_Player.switch_to("main")
	elif Input.is_action_just_pressed("ui_title"):
		stop_p()
		Global_Player.full_health()
		Global_Player.switch_to("title")
	elif Input.is_action_just_pressed("ui_quit"):
		stop_p()
		Global_Player.switch_to("quit")

func stop_p():
	get_tree().paused = false

func _on_Menu_pressed():
	stop_p()
	Global_Player.switch_to("title")


func _on_Restart_pressed():
	stop_p()
	Global_Player.switch_to("main")


func _on_Quit_pressed():
	Global_Player.switch_to("quit")