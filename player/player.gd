extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 0.25

var held_item: Node2D

@onready var interaction_area: Area2D = $InteractionArea


func hold_item(item: Node2D) -> void:
	drop_item()
	held_item = item
	add_child(item)


func drop_item() -> void:
	if not held_item: return
	held_item.queue_free()
	held_item = null


func _physics_process(delta: float) -> void:
	velocity.x = lerpf(velocity.x, Input.get_axis(&"ui_left", &"ui_right") * 100.0, ACCEL)
	velocity.y = 100.0
	move_and_slide()
	
	if held_item:
		var angle: float = get_local_mouse_position().angle()
		held_item.rotation = lerp_angle(held_item.rotation, angle + PI * 0.5, 0.25)
		held_item.position = held_item.position.lerp(Vector2.from_angle(angle) * 16.0, 0.25)


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_accept"):
		for area: Area2D in interaction_area.get_overlapping_areas():
			if area == Game.current_task.pile:
				hold_item(area.item_scene.instantiate())
				Game.current_task.set_state(Task.State.DELIVER)
			elif area == Game.current_task.dropoff:
				drop_item()
				Game.current_task.set_state(Task.State.COMPLETE)
