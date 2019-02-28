extends AnimatedSprite

func update(motion):
	if motion.x > 0:
		flip_h = true
	elif motion.x < 0:
		flip_h = false