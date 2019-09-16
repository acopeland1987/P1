extends CanvasLayer

func _ready():
	pass
	
func _on_Player_death():
	$anim.play("death")
