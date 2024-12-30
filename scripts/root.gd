extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		var inst: Node2D = load("res://scenes/areaDamage.tscn").instantiate()
		inst.global_position = get_global_mouse_position()
		add_child(inst)

	if Input.is_action_just_pressed("clickR"):
		var inst: Node2D = load("res://scenes/areaDamage.tscn").instantiate()
		inst.damage_type = WaterDamage.new()
		inst.global_position = get_global_mouse_position()
		add_child(inst)
