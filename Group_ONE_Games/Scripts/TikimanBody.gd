extends "res://Scripts/Creatures.gd"
var map = Node2D
# Declare member variables here. Examples:
# var a = 2
var player
var move = false

# Called when the node enters the scene tree for the first time.
func _ready():
	setcreature("tikiman")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if move:
		for body in $Area2D.get_overlapping_bodies():
			if body.is_in_group("Player"):
				var current_position = self.get_global_position()
				var target = body.get_global_position()
				var goto = (target - current_position).normalized()
				var thing = move_and_collide(goto * speed*delta)
				
				if thing != null: #if we collide with somethign  
					var  obj = instance_from_id(thing.collider_id)
					if obj.has_method("damage"):
						obj.damage("tikiman", attack)
					else:
						move_and_slide(goto*speed)



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		move = true
		$AnimatedSprite.animation = "Walk"


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		move = false
		$AnimatedSprite.animation = "Stand"
	
