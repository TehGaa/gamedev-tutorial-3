extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -300
var count_jump = 0
var count_slide_left = 0
var count_slide_right = 0
var is_crouch = false
var dir = "default"

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
		dir = "left"
		if not is_crouch:
			$AnimatedSprite2D.play("side_walk")
		$AnimatedSprite2D.flip_h = true
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		dir = "right"
		if not is_crouch:
			$AnimatedSprite2D.play("side_walk")
		$AnimatedSprite2D.flip_h = false
		velocity.x =  walk_speed
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("crouch")
		walk_speed = 50
		is_crouch = true
	else:
		dir = "default"
		$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.flip_h = false
		velocity.x = 0
	
	if Input.is_action_just_released("ui_down"):
		is_crouch = false
		walk_speed = 200

	# "move_and_slide" already takes delta time into account.
	move_and_slide()
