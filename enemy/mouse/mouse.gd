extends StaticBody2D


# Called when the node enters the scene tree for the first time.
const SEED = preload("res://enemy/projectile/seed.tscn") 
@onready var play_animation = $AnimatedSprite2D

func _ready():
	play_animation.play("Static")


#decides the time and placement of the seeds spawer
func _on_seed_spawner_timeout() -> void:
	play_animation.play("Spit_Seeds")
	get_tree().get_first_node_in_group("player")
	var direction = global_position.direction_to(player.global_position)
	var new_seed = SEED.instantiate()
	add_child(new_seed)
	print("get seeded")
