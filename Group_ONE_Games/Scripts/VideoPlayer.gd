extends Control
onready var audioStream = $"/root/DemoLevel/Music/BackgroundMusic"
onready var controlPopUp = load("res://Scenes/PopUpScroll_Controls.tscn")
onready var demoLevel = get_node("/root/DemoLevel")
func _ready():
	audioStream.stop()
	pass 

func _on_VideoPlayer_finished():
	if $VideoPlayer.stream.get_file() == "res://Cutscenes/Ending.ogv":
		Global_Player.switch_to("title")
		get_tree().paused = false
		audioStream.play()
		hide()
	if $VideoPlayer.stream.get_file() == "res://Cutscenes/Opening.ogv":
		demoLevel.add_child(controlPopUp.instance())
		get_tree().paused = true
		audioStream.play()
		hide()
	else:
		get_tree().paused = false
		audioStream.play()
		hide()


func _unhandled_key_input(event):
	if self.is_visible():
		if event.is_action_pressed("ui_accept"):
			$Timer.start(-1)
		if event.is_action_released("ui_accept") && $Timer.time_left > 0:
			$Timer.stop()


func _on_Timer_timeout():
	if $VideoPlayer.stream.get_file() == "res://Cutscenes/Ending.ogv":
		Global_Player.switch_to("title")
	if $VideoPlayer.stream.get_file() == "res://Cutscenes/Opening.ogv":
		demoLevel.add_child(controlPopUp.instance())
		$VideoPlayer.stop()
		get_tree().paused = true
		audioStream.play()
		hide()
	else:
		$VideoPlayer.stop()
		get_tree().paused = false
		audioStream.play()
		hide()


func play_scene(scene):
	$VideoPlayer.stream = scene
	if get_tree().paused != true:
		get_tree().paused = true
	audioStream.stop()
	show()
	$VideoPlayer.play()
