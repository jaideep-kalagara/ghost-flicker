extends CharacterBody2D

const SPEED = 100.0

@onready var AnimatedSprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var horizontal := Input.get_axis("move_left", "move_right")
	var vertical := Input.get_axis("move_up", "move_down")

	# Flip sprite based on horizontal movement
	if horizontal != 0:
		AnimatedSprite.flip_h = horizontal < 0

	# Set animation
	if horizontal != 0 or vertical != 0:
		AnimatedSprite.animation = "Move"
	else:
		AnimatedSprite.animation = "Idle"

	# Apply velocity
	velocity.x = horizontal * SPEED
	velocity.y = vertical * SPEED

	move_and_slide()
