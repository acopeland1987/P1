extends KinematicBody2D

var SPEED = 160
var GRAVITY = 12
var JUMP_POWER = 300
var FLOOR = Vector2(0,-1)

var velocity = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = -JUMP_POWER
		
	velocity.y += GRAVITY
		
	velocity = move_and_slide(velocity, FLOOR)