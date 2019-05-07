extends Node
onready var videoPlayer = $CanvasLayer/VideoPlayer/VideoPlayer
onready var audioStream = $Music/BackgroundMusic

func _on_DemoLevel_ready():
	get_tree().paused = true
	$CanvasLayer/VideoPlayer.show()
	videoPlayer.play()

