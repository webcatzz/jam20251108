extends Node


func _process(delta: float) -> void:
	$Overlay/Margins/Label.text = "%.2fs" % Game.timer.time_left
