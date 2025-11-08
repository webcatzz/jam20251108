extends CharacterBody2D

const SPEED = 200.0
const ACCEL = 0.25

var held_item: Node

@onready var interaction_area: Area2D = $InteractionArea


func hold_item(item: Node) -> void:
	drop_item()
	held_item = item
	add_child(item)


func drop_item() -> void:
	if not held_item: return
	held_item = null


func _physics_process(delta: float) -> void:
	velocity.x = lerpf(velocity.x, Input.get_axis(&"ui_left", &"ui_right") * 100.0, ACCEL)
	velocity.y = 100.0
	move_and_slide()


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"ui_accept"):
		for area: Area2D in interaction_area.get_overlapping_areas():
			if area is Pile and area.item_scene:
				hold_item(area.item_scene.instantiate())
