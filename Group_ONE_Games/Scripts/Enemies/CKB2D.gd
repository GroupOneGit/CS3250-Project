extends KinematicBody2D

var velocity = Vector2(0,0) #Where it's going
var anitime #animation time
var debug = true
var speed =100

func _ready():
	velocity.x = 1
	velocity.y = 0
	anitime = 0.0

func set_direction():
	if velocity.x > 0:
		velocity.x = -1
	else:
		velocity.x = 1 
	randomize()
	var y = (randf() -.5)*.9
	velocity.y = y
	

func _physics_process(delta):
	# This does collisons and tests if the crab collides witha anything
	if velocity.x == 0:
		set_direction(delta)
	var thing = self.move_and_collide(velocity.normalized() * delta * speed)
	
	if thing != null: #if we collide with somethign  
		set_direction()
	
	# Flip the sprite for animations.
	anitime += delta
	if anitime > .3:
		anitime = 0
		$Sprite.flip_h = not $Sprite.flip_h
	$Sprite.update()