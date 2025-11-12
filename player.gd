extends StaticBody2D

const PADDLE_SPEED = 400.0

func _process(delta: float) -> void:

	if Input.is_action_pressed("left"):
		position.x -= PADDLE_SPEED * delta
	if Input.is_action_pressed("right"):
		position.x += PADDLE_SPEED * delta
