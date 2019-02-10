extends KinematicBody2D

var velocity = Vector2(0,0) #Where it's going
var anitime #animation time


func _ready():
	velocity.x = 1
	velocity.y = 0
	etime = 0.0

func set_direction():
	if velocity.x > 0:
		velocity.x = -1
	else:
		velocity.x = 1 
	randomize()
	var fl = randf()
	if fl < .3:
		velocity.y = .5
		velocity.x = velocity.x*(6/7)
	elif fl > .7:
		velocity.y = -.5
		velocity.x = velocity.x*(6/7)
	else:
		velocity.y = 0
	

func _physics_process(delta):
	# This does collisons and tests if the crab collides witha anything
	if velocity.x == 0:
		set_direction()
	var thing = self.move_and_collide(velocity * delta * 100)
	if thing != null: #if we collide with somethign  
		set_direction()
	$Sprite.update()
	
	# Flip the sprite for animations.
	etime += delta
	if etime > .3:
		etime = 0
		$Sprite.flip_h = not $Sprite.flip_h
	