extends CharacterBody2D

signal point
var speed = 300

func _ready():
	pass  

func launch():
	velocity = Vector2(1,1) * speed

func launch_delayed(delay_time: float = 1.0):
	# Stop the ball first
	velocity = Vector2.ZERO
	# Wait for delay_time seconds, then launch
	await get_tree().create_timer(delay_time).timeout
	launch()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().name == "Player":

			_bounce_from_paddle(collision)
		else:
			velocity = velocity.bounce(collision.get_normal())
		
		if collision.get_collider().is_in_group("blocks"):
			speed += 50
			velocity = velocity.normalized() * speed
			collision.get_collider().destroy()
			emit_signal("point")
			
func _bounce_from_paddle(collision):
	var paddle = collision.get_collider()
	var paddle_pos = paddle.global_position.x
	var ball_pos = global_position.x
	var paddle_shape = paddle.get_node("CollisionShape2D").shape
	var paddle_width = paddle_shape.size.x
	
	var offset = (ball_pos - paddle_pos) / (paddle_width / 2)
	
	offset = clamp(offset, -1,1)
	
	var direction = Vector2(offset,-1).normalized()
	
	velocity = direction * speed
