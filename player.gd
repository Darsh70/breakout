extends StaticBody2D

var PADDLE_SPEED = 400
var PADDLE_WIDTH
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PADDLE_WIDTH = $ColorRect.get_rect().size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position.x -= PADDLE_SPEED * delta
	if Input.is_action_pressed("right"):
		position.x += PADDLE_SPEED * delta
