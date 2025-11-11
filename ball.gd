extends CharacterBody2D



func _ready():
	velocity = Vector2(200,200)
	

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		if collision.get_collider().is_in_group("blocks"):
			collision.get_collider().destroy()



	
			
