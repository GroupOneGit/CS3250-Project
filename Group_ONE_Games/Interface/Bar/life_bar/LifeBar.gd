extends HBoxContainer


var maximum_value = 20

func _on_Interface_health_changed(health):
	$TextureProgress.value = health
	$Counter/Label.text = "%s / %s" % [health, maximum_value]
