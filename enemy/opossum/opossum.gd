extends Area2D

var opossum_speed = 35.7  
@onready var play_animation = $AnimatedSprite2D
var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_animation.play("Walk_Left")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= opossum_speed * delta * direction



func _on_timer_timeout() -> void:
	if direction == 1:
		direction = -1
		play_animation.play("Walk_Right")
	else:
		direction = 1
		play_animation.play("Walk_Left")


func _on_area_entered(area: Area2D) -> void:
	Game.take_damage()
