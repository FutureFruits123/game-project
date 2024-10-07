extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -250.0
var jumps = 0
var dashSpeed = 3000
var hasDashed = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jumping
	if is_on_floor():
		jumps = 0
		hasDashed = false

	if Input.is_action_just_pressed("ui_accept") and jumps < 2:
		velocity.y = JUMP_VELOCITY
		jumps = jumps + 1
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("shift") and hasDashed == false:
		velocity.x = direction * dashSpeed
		hasDashed = true

	move_and_slide()
