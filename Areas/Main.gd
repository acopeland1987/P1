extends Node2D

func _ready():
	pass
	
func _on_Player_death():
	get_tree().paused = true