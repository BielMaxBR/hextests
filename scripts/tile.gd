extends Node2D
class_name Tile

@export var state: TileType

func _ready() -> void:
	state = GrassTile.new()
	state.tile = self
	state.init()

func update_state(event: DamageType):
	# tu tem, salvar as configs de tile em resource, ai só faz load nele pela pasta.
	# o resource vai ter a função de troca de state, e seus sprites e efeitos
	state.update(event)
	pass

func change_state(new_state: TileType):
	state = new_state
	state.tile = self
	state.init()
