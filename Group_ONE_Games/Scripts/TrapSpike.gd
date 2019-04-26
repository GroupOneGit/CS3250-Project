extends Node2D
export var direction_x = 0
export var direction_y = 0
export var move_speed = 200
var reloading = false


func _process(delta):
	position += Vector2(move_speed * direction_x * delta , move_speed * direction_y * delta)

func _ready():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player") && body.has_method("damage"):
		print("OUCH!")
		body.damage("Player", 15)
		body.modulate = ColorN("red")
		
		


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player") && body.has_method("damage"):
		body.modulate = ColorN("white")
		queue_free()
	pass # Replace with function body.