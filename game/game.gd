extends Node

const TIME_CURVE = preload("res://time_curve.tres")

var current_task: Task
var tasks_completed: int

@onready var timer: Timer = $Timer


func _ready() -> void:
	next_task()


func set_task(task: Task) -> void:
	current_task = task
	timer.start(task.time)
	task.completed.connect(_on_task_completed, CONNECT_ONE_SHOT)


func next_task() -> void:
	var pile: Pile = get_tree().get_nodes_in_group(&"pile").pick_random()
	var dropoff: DropOff = get_tree().get_nodes_in_group(&"dropoff").pick_random()
	set_task(Task.new(
		pile,
		dropoff,
		TIME_CURVE.sample(tasks_completed) + 0.001 * pile.global_position.distance_to(dropoff.global_position)
	))


func _on_task_completed() -> void:
	tasks_completed += 1
	next_task()


func take_damage() -> void:
	timer.start(timer.time_left - 4.0)
	$Hurt.play()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://end.tscn")
