extends CharacterBody2D



const PADDLE_SPEED = 400

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("left"):
		position.x -= PADDLE_SPEED * delta
	if Input.is_action_pressed("right"):
		position.x += PADDLE_SPEED * delta

	move_and_slide()
