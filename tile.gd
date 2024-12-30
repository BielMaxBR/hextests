extends Node2D
class_name Tile

@export var state: String = "grass"

func update_state(event):
	# tu tem, salvar as configs de tile em resource, ai só faz load nele pela pasta.
	# o resource vai ter a função de troca de state, e seus sprites e efeitos
	pass
