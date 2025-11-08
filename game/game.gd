extends Node

var current_task: Task

@onready var timer: Timer = $Timer


func _ready() -> void:
	next_task()


func set_task(task: Task) -> void:
	current_task = task
	timer.start(task.time)
	task.completed.connect(next_task, CONNECT_ONE_SHOT)


func next_task() -> void:
	set_task(Task.new(Task.Type.COLLECT, Vector2.ZERO, 30.0))
