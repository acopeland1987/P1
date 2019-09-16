extends Control

func _ready():
	$anim.play("none")
	pass
	
func _on_Finish_body_entered(body):
	$anim.current_animation = "win"