extends CanvasLayer


func _process(delta: float) -> void:
	$Label.text = "%.2fs" % Game.timer.time_left
