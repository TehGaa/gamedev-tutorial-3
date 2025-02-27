extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -300
var count_jump = 0
var count_slide_left = 0
var count_slide_right = 0

func _physics_process(delta: float) -> void:
	velocity.y += delta * gravity
	if is_on_floor():
		count_jump = 0
		
	if count_jump < 2 and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed
		count_jump += 1
	
	if Input.is_action_just_pressed("ui_left"):
		count_slide_left += 1
		if count_slide_left == 2:
			velocity.x = -walk_speed * 20
			count_slide_left = 0
			move_and_slide()
	
	if Input.is_action_just_pressed("ui_right"):
		count_slide_right += 1
		if count_slide_right == 2:
			velocity.x = walk_speed * 20
			count_slide_right = 0
			move_and_slide()
	
			
	if Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0

	# "move_and_slide" already takes delta time into account.
	move_and_slide()



#func _on_timer_timeout() -> void:
	#timer_running = false
	#$Timer.stop()
