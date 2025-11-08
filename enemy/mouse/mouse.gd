extends StaticBody2D


# Called when the node enters the scene tree for the first time.
const SEED = preload("res://enemy/projectile/seed.tscn") 

#decides the time and placement of the seeds spawer
func _on_seed_spawner_timeout() -> void:
	var new_seed = SEED.instantiate()
	add_child(new_seed)
	print("seed time")


func _on_seed_despawner_timeout() -> void:
	queue_free()
