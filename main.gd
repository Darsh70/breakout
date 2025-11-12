extends Node2D

var score = 0
var lives = 3
var highscore = 0
const SAVE_PATH = "user://highscore.save"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highscore = load_highscore()

func save_highscore(value: int):
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(value)
		file.close()

func load_highscore():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var value = file.get_var()
		file.close()
		return value
	return 0
	
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
			if score > highscore:
				highscore = score
				save_highscore(highscore)
			$Score/Label3.text = "Game Over" + "Score:" + str(score) + "HS:" + str(highscore)
			$Score/Label3.visible = true
			$Player.set_process(false)
			$Score/Button.visible = true
	if lives != 0:
		restart()
	

func restart():
	$Ball.speed = 300
	$Ball.position = $Player.position
	$Ball.velocity = Vector2.ZERO 
	$Ball.launch_delayed(1.0)


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()
