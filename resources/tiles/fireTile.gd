extends TileType
class_name FireTile

func _init():
	sprite = load("res://sprites/fire.png")

func update(damage: DamageType):
	if damage is WaterDamage:
		tile.change_state(DirtTile.new())
	
