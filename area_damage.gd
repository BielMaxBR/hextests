extends Node2D


@export var damage_type: Resource
@export var range: int = 128
@export var timer: int = 3

func _ready() -> void:
	var shape = $Area2D/CollisionShape2D.shape as CircleShape2D
	shape.radius = range
	$Timer.start(timer)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Tile:
		area.get_parent().damage(damage_type.type)

func _on_timer_timeout() -> void:
	queue_free()
