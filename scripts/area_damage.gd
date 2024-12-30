extends Node2D

@export var damage_type: DamageType
@export var radius: int = 128
@export var timer: int = 3

func _ready() -> void:
	var shape = $Area2D/CollisionShape2D.shape as CircleShape2D
	shape.radius = radius
	$Timer.wait_time = timer
	$Timer.start()

func _process(delta: float) -> void:
	queue_redraw()
	
func _draw() -> void:
	var color = damage_type.color
	color.a =  (($Timer.time_left+1) / $Timer.wait_time) * 0.5
	draw_circle(Vector2.ZERO,radius,color)
	color.a = 1
	draw_circle(Vector2.ZERO,radius,color,false,3)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var parent := area.get_parent()
	if parent is Tile:
		parent.update_state(damage_type)

func _on_timer_timeout() -> void:
	queue_free()
