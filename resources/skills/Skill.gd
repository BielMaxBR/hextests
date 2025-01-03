extends Resource
class_name Skill

var cooldown: float = 0
var _counter = 0

func _init() -> void:
	pass

func run(data:={}):
	pass

func update(delta: float):
	if cooldown != 0: _counter += delta
	if _counter >= cooldown:
		_counter = 0
		_timeout()

func _timeout():
	pass
