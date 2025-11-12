extends Node2D

var score = 0
var lives = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Score/Label.text = str(score)
	$Score/Label2.text = str(lives)


func _on_block_break_point() -> void:
	score += 1


func _on_death_body_entered(body: Node2D) -> void:

	if body.name == "Ball":
		lives -= 1
		if lives == 0:
			$Score/Label3.visible = true
			$Player.set_process(false)
			$Score/Button.visible = true
	if lives != 0:
		restart()
	

func restart():
	$Ball.position = $Player.position
	$Ball.velocity = Vector2.ZERO 
	$Ball.launch_delayed(1.0)


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
