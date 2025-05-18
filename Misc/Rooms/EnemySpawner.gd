extends Node2D


var SimpleSkeleton = preload("res://Entities/Level1/SkeletonEnemy/Skeleton.tscn")
var RedSkeleton = preload("res://Entities/Level1/SkeletonEnemy/RedSkeleton.tscn")
var FireBat = preload("res://Entities/Level1/FireBatEnemy/FireBat.tscn")
var Bat = preload("res://Entities/Level1/BatEnemy/Bat.tscn")
var HalberdSkeleton = preload("res://Entities/Level1/SkeletonEnemy/SkeletonHalberd.tscn")
var RogueSkeleton = preload("res://Entities/Level1/SkeletonEnemy/SkeletonRogue.tscn")
var Wraith = preload("res://Entities/Level1/WraithEnemy/Wraith.tscn")
var WildDog = preload("res://Entities/Begin/Dog/Dog2.tscn")
var SimpleGhost = preload("res://Entities/Begin/Ghost/Ghost.tscn")
var FireGhost = preload("res://Entities/Begin/Ghost/FireGhost.tscn")







# Called when the node enters the scene tree for the first time.
func _ready():
	var random = randi() % 9
	match random:
		0:_spawnskeleton()
		1:_spawnredskeleton()
		2:_spawnhalberdskeleton()
		3:_spawnrogueskeleton()
		4:_spawnwraith()
		5:_spawndog()
		6:_spawnbat()
		7:_spawnfirebat()
		8: _spawnghost()
		9: _spawnfireghost()


func _spawnfireghost():
	var FGhost = FireGhost.instance()
	$"../../Enemies".add_child(FGhost)
	FGhost.global_position = global_position

func _spawnghost():
	var SGhost = SimpleGhost.instance()
	$"../../Enemies".add_child(SGhost)
	SGhost.global_position = global_position

func _spawnskeleton():
	var SSkeleton = SimpleSkeleton.instance()
	$"../../Enemies".add_child(SSkeleton)
	SSkeleton.global_position = global_position


func _spawnredskeleton():
	var RSkeleton = RedSkeleton.instance()
	$"../../Enemies".add_child(RSkeleton)
	RSkeleton.global_position = global_position



func _spawnhalberdskeleton():
	var HSkeleton = HalberdSkeleton.instance()
	$"../../Enemies".add_child(HSkeleton)
	HSkeleton.global_position = global_position



func _spawnrogueskeleton():
	var RoSkeleton = RogueSkeleton.instance()
	$"../../Enemies".add_child(RoSkeleton)
	RoSkeleton.global_position = global_position


func _spawnwraith():
	var OldWraith = Wraith.instance()
	$"../../Enemies".add_child(OldWraith)
	OldWraith.global_position = global_position



func _spawndog():
	var Dog = WildDog.instance()
	$"../../Enemies".add_child(Dog)
	Dog.global_position = global_position


func _spawnbat():
	var SimpleBat= Bat.instance()
	$"../../Enemies".add_child(SimpleBat)
	SimpleBat.global_position = global_position


func _spawnfirebat():
	var Firebat= FireBat.instance()
	$"../../Enemies".add_child(Firebat)
	Firebat.global_position = global_position




