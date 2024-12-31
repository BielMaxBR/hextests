extends Node2D

@export var damage_type: DamageType
@export var radius: int = 128
@export var timer: int = 3
@export var instant: bool = false

var tick: float = .3
var counter: float = 0

func _ready() -> void:
	var shape = $Area2D/CollisionShape2D.shape as CircleShape2D
	shape.radius = radius
	$Timer.wait_time = timer
	$Timer.start()

func run():
	var areas = $Area2D.get_overlapping_areas()
	for area: Area2D in areas:
		var parent := area.get_parent()
		if parent is Tile:
			parent.update_state(damage_type)

func _process(delta: float) -> void:
	queue_redraw()
	if not instant:
		counter += delta
	if counter >= tick:
		counter = 0
		run()

func _draw() -> void:
	var color = damage_type.color
	color.a =  (($Timer.time_left+.5) / $Timer.wait_time) * 0.5
	draw_circle(Vector2.ZERO,radius,color)
	color.a = 1
	draw_circle(Vector2.ZERO,radius,color,false,3)

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	var parent := area.get_parent()
	if parent is Tile:
		parent.update_state(damage_type)
