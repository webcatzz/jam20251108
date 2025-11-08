extends Camera2D


func _physics_process(delta: float) -> void:
	position.x += Input.get_axis(&"ui_left", &"ui_right") * 200.0 * delta
