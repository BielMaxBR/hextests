extends Resource
class_name TileType

var tile: Tile
var sprite: Texture2D

func init():
	var tile_sprite := tile.get_node("Sprite") as Sprite2D
	tile_sprite.texture = sprite

func update(damage: DamageType):
	#checar eventos e mudar de type
	pass

func process(delta: float):
	pass
