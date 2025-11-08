class_name Task

enum Type {COLLECT, DELIVER}

var type: Type
var position: Vector2


func _init(type: Type, position: Vector2) -> void:
	self.type = type
	self.position = position
