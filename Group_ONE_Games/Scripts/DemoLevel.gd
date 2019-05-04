extends Node
onready var videoPlayer = $CanvasLayer/VideoPlayer/VideoPlayer

func _on_DemoLevel_ready():
	get_tree().paused = true
	$CanvasLayer/VideoPlayer.show()
	videoPlayer.play()
	pass # Replace with function body.
