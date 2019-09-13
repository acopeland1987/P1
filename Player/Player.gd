extends KinematicBody2D

var SPEED = 190
var GRAVITY = 15
var JUMP_POWER = 320
var DASH_POWER = 5
var FLOOR = Vector2(0,-1)

var dashing = false
var velocity = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$anim.play("left")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$anim.play("right")
	else:
		velocity.x = 0
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = -JUMP_POWER
		
	if Input.is_action_just_pressed("ui_dash"):
		dash()
		
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)

func dash():
	SPEED *= DASH_POWER
	dashing = true
	$Timer.start()


func _on_Timer_timeout():
	SPEED = 190
	dashing = false
