extends Node


func _ready() -> void:
	$VBoxContainer/Label3.text %= Game.tasks_completed
