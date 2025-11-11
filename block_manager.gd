extends Node2D


@export var block_scene: PackedScene
@export var columns = 5
@export var rows = 3
@export var spacing = Vector2(200,60)
@export var start_position = Vector2(0,300)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for row in range(rows):
		for col in range(columns):
			var block = block_scene.instantiate()
			block.position = start_position + Vector2(spacing.x * col, spacing.y * row)
			
			var color_rect = block.get_node("ColorRect")
			color_rect.color = Color(0,0,1)
			add_child(block)
