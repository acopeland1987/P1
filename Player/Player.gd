extends KinematicBody2D

var SPEED = 190
var GRAVITY = 15
var JUMP_POWER = 320
var DASH_POWER = 5
var FLOOR = Vector2(0,-1)

var sprite_node 
var dashing = false
var velocity = Vector2()

func _ready():
	sprite_node = get_node("Jumpsprite")

func _physics_process(delta):
	control_loop()
	anim_loop()
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
		

func control_loop():
	if Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		sprite_node.set_flip_h(true)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		sprite_node.set_flip_h(false)
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = -JUMP_POWER
	
	if Input.is_action_just_pressed("ui_dash"):
		dash()
			
func anim_loop():
	if is_on_floor():
		if velocity.x == 0:
			$anim.current_animation = "run"
		elif velocity.x != 0:
			pass
	else:
		if velocity.y < 0:
			$anim.current_animation = "jump"
		else:
			$anim.current_animation = "fall"

func dash():
	SPEED *= DASH_POWER
	dashing = true
	$Timer.start()

func _on_Timer_timeout():
	SPEED = 190
	dashing = false
