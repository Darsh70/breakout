extends CharacterBody2D

signal point

func _ready():
	pass  

func launch():
	velocity = Vector2(200, 200)  

func launch_delayed(delay_time: float = 1.0):
	# Stop the ball first
	velocity = Vector2.ZERO
	# Wait for delay_time seconds, then launch
	await get_tree().create_timer(delay_time).timeout
	launch()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		if collision.get_collider().is_in_group("blocks"):
			collision.get_collider().destroy()
			emit_signal("point")
