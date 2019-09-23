extends KinematicBody2D

var velocity = Vector2()
var SPEED = 190
var GRAVITY = 3

func _physics_process(delta):
	velocity.y += GRAVITY
	move_and_slide(velocity)