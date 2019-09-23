extends Area2D

onready var win = preload("res://Areas/Animations/Win.tscn")



func _ready():
	$anim.play("flash")
	
	


func _on_Finish_body_entered(Player):
	queue_free()
