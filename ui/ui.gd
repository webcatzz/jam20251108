extends Node


func _process(delta: float) -> void:
	$Overlay/Label.text = "%.2fs" % Game.timer.time_left
