extends Node2D


var wooden = preload("res://Levels/LevelAssets/Sprites/Chests/woodenChest.tscn")
var golden = preload("res://Levels/LevelAssets/Sprites/Chests/GoldenChest.tscn")
var silver = preload("res://Levels/LevelAssets/Sprites/Chests/SilverChest.tscn")
var bronze = preload("res://Levels/LevelAssets/Sprites/Chests/BronzeChest.tscn")






# Called when the node enters the scene tree for the first time.
func _ready():
	var random = randi() % 4
	match random:
		0:_spawnwooden()
		1:_spawngolden()
		2:_spawnsilver()
		3:_spawnbronze()


func _spawnwooden():
	var Wooden = wooden.instance()
	add_child(Wooden)
	Wooden.global_position = global_position

func _spawngolden():
	if randf() < 0.1:
		var Golden = golden.instance()
		add_child(Golden)
		Golden.global_position = global_position
	else:
		_spawnsilver()

func _spawnsilver():
	if randf() < 0.3:
		var Silver = silver.instance()
		add_child(Silver)
		Silver.global_position = global_position
	else:
		_spawnbronze()

func _spawnbronze():
	if randf() < 0.5:
		var Silver = silver.instance()
		add_child(Silver)
		Silver.global_position = global_position
	else:
		_spawnwooden()
