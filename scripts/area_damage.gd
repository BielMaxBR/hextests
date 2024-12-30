extends Node2D

@export var damage_type: DamageType
@export var radius: int = 128
@export var timer: int = 3

func _ready() -> void:
	var shape = $Area2D/CollisionShape2D.shape as CircleShape2D
	shape.radius = radius
	$Timer.start(timer)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var parent := area.get_parent()
	if parent is Tile:
		parent.update_state(damage_type)
		print(parent.global_position)

func _on_timer_timeout() -> void:
	queue_free()
