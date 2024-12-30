extends TileType
class_name GrassTile

func _init():
	sprite = load("res://sprites/grass.png")

func update(damage: DamageType):
	print("dano vindo de:",tile.global_position)
	if damage is FireDamage:
		tile.change_state(FireTile.new())
	
