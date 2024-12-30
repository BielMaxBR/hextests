extends Node2D
class_name Tile

@export var state: TileType
@onready var tilemap: TileMapLayer = get_parent()
var map_coord: Vector2


func _ready() -> void:
	map_coord = tilemap.local_to_map(global_position)
	name = "Tile(%d,%d)" % [map_coord.x,map_coord.y]
	state = GrassTile.new()
	state.tile = self
	state.init()
	
func update_state(event: DamageType):
	# eu preciso fazer, esse tilemap sempre rodar o update junto ao process
	# mas ao mesmo tempo ele precisa continuar ouvindo eventos como esse
	# ou seja, a detecção de coisas ocorrendo precisa ser feita por ele, e não pela causa
	state.update(event)
	pass

func change_state(new_state: TileType):
	state = new_state
	state.tile = self
	state.init()

func get_neighbors(central_coord: Vector2i = map_coord) -> Array[Tile]:
	var coord_list = tilemap.get_surrounding_cells(central_coord)
	var neighbors = []
	
	for coord in coord_list:
		var tile := tilemap.get_node("Tile(%d,%d)" % [coord.x, coord.y])
		if tile is Tile:
			neighbors.append(tile)
	return neighbors
