extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_InteractArea_input_event(viewport, event, shape_idx):
	if Input.is_action_pressed("ui_interact"):
		print("fuck")
		var overlaps = get_overlapping_areas()
		for area in overlaps:
			if area.is_in_group("Interactable"):
				print("we did it")
	pass # Replace with function body.
