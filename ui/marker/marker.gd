extends Node2D


func _process(delta: float) -> void:
	var target_position := Vector2.ZERO
	var rect: Rect2 = get_viewport().get_visible_rect()
	if Game.current_task:
		match Game.current_task.state:
			Task.State.COLLECT: target_position = Game.current_task.pile.global_position
			Task.State.DELIVER: target_position = Game.current_task.dropoff.global_position
	position = target_position.clamp(rect.position, rect.end)
