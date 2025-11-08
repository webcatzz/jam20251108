class_name Task

signal completed

enum State {COLLECT, DELIVER, COMPLETE}

var state: State
var pile: Pile
var dropoff: DropOff
var time: float


func _init(pile: Pile, dropoff: DropOff, time: float) -> void:
	self.pile = pile
	self.dropoff = dropoff
	self.time = time


func set_state(value: State) -> void:
	state = value
	if state == State.COMPLETE: completed.emit()
