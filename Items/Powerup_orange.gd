extends Area2D

func _ready():
	$anim.play("rotate")

func _on_powerup_body_entered(body):
	queue_free()
