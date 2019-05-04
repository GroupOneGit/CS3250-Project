extends Control

func _ready():
	pass # Replace with function body.

func _on_VideoPlayer_finished():
	get_tree().paused = false
	hide()


func _unhandled_key_input(event):
	if self.is_visible():
		if event.is_action_pressed("ui_accept"):
			$Timer.start(-1)
		if event.is_action_released("ui_accept") && $Timer.time_left > 0:
			$Timer.stop()


func _on_Timer_timeout():
	$VideoPlayer.stop()
	get_tree().paused = false
	hide()

