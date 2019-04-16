extends Node

func _on_Area2D_body_entered(body):
	if body.has_method("heal"):
		body.heal("food", 10)
		queue_free()
