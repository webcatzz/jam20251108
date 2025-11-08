class_name Task

signal completed

enum Type {COLLECT, DELIVER}

var type: Type
var position: Vector2
var time: float


func _init(type: Type, position: Vector2, time: float) -> void:
	self.type = type
	self.position = position
	self.time = time


func complete() -> void:
	completed.emit()
