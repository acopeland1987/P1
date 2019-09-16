extends CanvasLayer

func _ready():
	pass

func death():
	$anim.play("death")
	
func _on_Player_death():
	death()
