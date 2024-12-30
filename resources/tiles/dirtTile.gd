extends TileType
class_name DirtTile

func _init():
	sprite = load("res://sprites/dirt.png")

func update(damage: DamageType):
	if damage is WaterDamage:
		tile.change_state(GrassTile.new())
	
