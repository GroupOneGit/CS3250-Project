extends Node


onready var HP_label = $BarContainer/HealthBar/Variable_Value
onready var HP_bar = $BarContainer/HealthBar/TextureProgress

onready var TP_label = $BarContainer/ThirstBar/Variable_Value
onready var TP_bar = $BarContainer/ThirstBar/TextureProgress

onready var EP_label = $BarContainer/EnergyBar/Variable_Value
onready var EP_bar = $BarContainer/EnergyBar/TextureProgress


func _ready():
	Global.GUI = self


func _on_Player_health_changed(player_health):
	update_health(player_health)
	

func update_health(new_value):
	HP_label.text  = str(new_value)
	HP_bar.value = new_value


func _on_Player_thirst_changed(player_thirst):
	update_thirst(player_thirst)
	
	
func update_thirst(new_value):
	TP_label.text = str(new_value)
	TP_bar.value = new_value
	
	
func _on_Player_energy_changed(player_energy):
	update_energy(player_energy)
	
	
func update_energy(new_value):
	EP_label.text = str(new_value)
	EP_bar.value = new_value