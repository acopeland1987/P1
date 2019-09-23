extends Node2D

export (PackedScene) var Sword

func _ready():
	pass
	
func _on_Player_death():
	get_tree().paused = true
	
func _on_Finish_body_entered(body):
	get_tree().paused = true