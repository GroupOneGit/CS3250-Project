extends Node

onready var HP_label = $Background/StatusBarContainer/BarContainer/HealthBar/Variable_Value
onready var HP_bar = $Background/StatusBarContainer/BarContainer/HealthBar/TextureProgress
onready var TP_label = $Background/StatusBarContainer/BarContainer/ThirstBar/Variable_Value
onready var TP_bar = $Background/StatusBarContainer/BarContainer/ThirstBar/TextureProgress
onready var EP_label = $Background/StatusBarContainer/BarContainer/EnergyBar/Variable_Value
onready var EP_bar = $Background/StatusBarContainer/BarContainer/EnergyBar/TextureProgress


func _ready():
	Global_Player.connect("health_changed", self, "_on_Player_health_changed")
	Global_Player.connect("thirst_changed", self, "_on_Player_thirst_changed")
	Global_Player.connect("energy_changed", self, "_on_Player_energy_changed")


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