extends Node2D


func _process(delta: float) -> void:
	if Game.current_task:
		match Game.current_task.state:
			Task.State.COLLECT: mark(Game.current_task.pile.global_position)
			Task.State.DELIVER: mark(Game.current_task.dropoff.global_position)


func mark(point: Vector2) -> void:
	var camera: Camera2D = get_viewport().get_camera_2d()
	var viewport_size: Vector2 = get_viewport_rect().grow(-64.0).size / camera.zoom
	var rect := Rect2(camera.global_position - viewport_size / 2, viewport_size)
	position = point.clamp(rect.position, rect.end)
