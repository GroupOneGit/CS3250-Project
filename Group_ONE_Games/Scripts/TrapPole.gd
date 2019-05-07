extends Node2D

onready var spike_scene = preload("res://Scenes/TrapSpike.tscn")
var spike_rotation = 0
var spike_y = 0
var spike_x = 0
var can_shoot = true
var in_range = false



func shoot():
	spike_rotation = 0
	spike_y = 0
	spike_x = 0
	var count = 10
	var radius = Vector2(30,0)
	var center = position
	var step = 2 * PI / count
	for i in range(count):
		var spawn_pos = center + radius.rotated(step * i)
		var spike_instance = spike_scene.instance()
		spike_instance.position = spawn_pos - position
		if i > 0:
			spike_rotation += rad2deg(step)
			spike_y = sin(deg2rad(spike_rotation))
			spike_x = cos(deg2rad(spike_rotation))
			spike_instance.rotation_degrees = spike_rotation
			spike_instance.direction_y = spike_y
			spike_instance.direction_x = spike_x
		else:
			spike_instance.direction_x = 1
		add_child(spike_instance)
	can_shoot = false
	$Pole.animation = "reload"
	$Pole.play("reload")
	get_node("Pole/ReloadTimer").start()


func _process(delta):
	if in_range && can_shoot:
		shoot()

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		in_range = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		in_range = false


func _on_ReloadTimer_timeout():
	can_shoot = true
	$Pole.play("default")
	pass # Replace with function body.
