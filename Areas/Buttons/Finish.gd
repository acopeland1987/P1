extends Area2D

func _ready():
	$anim.play("flash")
	


func _on_Finish_body_entered(body):
	queue_free()
