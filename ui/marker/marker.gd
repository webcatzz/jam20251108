extends Node2D


func _process(delta: float) -> void:
	if Game.current_task:
		position = Game.current_task.position
