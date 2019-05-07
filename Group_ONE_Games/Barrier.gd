extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global_Player.has_Hat and ItemDatabase.scrollsFound >= 8:
		queue_free()
