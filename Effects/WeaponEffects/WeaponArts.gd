extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if $"../FloorDetect".is_colliding() and $"../HemwickSword/CharacterEffects/SlamTravelDust/AnimationPlayer".current_animation == "Start":
			$"../HemwickSword/CharacterEffects/SlamTravelDust".visible = false
			$"../HemwickSword/CharacterEffects/SlamTravelDust/AnimationPlayer".stop()


func _dash():



	if $"../HemwickSword".scale.x == -1:
		var dash = preload("res://Effects/Dash.tscn").instance()
		get_tree().current_scene.add_child(dash)
		dash.scale.x = -1
		dash.global_position = $"../HemwickSword/Anchors/DashAnchor".global_position
	else:
		var dash = preload("res://Effects/Dash.tscn").instance()
		get_tree().current_scene.add_child(dash)
		dash.scale.x = 1
		dash.global_position = $"../HemwickSword/Anchors/DashAnchor".global_position

func _airdash():

	if $"../HemwickSword".scale.x == -1:
		var airdash = preload("res://Effects/AirDash.tscn").instance()
		get_tree().current_scene.add_child(airdash)
		airdash.scale.x = -1
		airdash.global_position = $"../HemwickSword/Anchors/AirDashAnchor".global_position
	else:
		var airdash = preload("res://Effects/AirDash.tscn").instance()
		get_tree().current_scene.add_child(airdash)
		airdash.scale.x = 1
		airdash.global_position = $"../HemwickSword/Anchors/AirDashAnchor".global_position


func _slam():
	var slam = preload("res://Effects/WeaponEffects/SlamDust.tscn").instance()
	get_tree().current_scene.add_child(slam)
	slam.global_position = global_position

	if $"../HemwickSword".scale.x == -1:
		slam.scale.x = -1
	else:
		slam.scale.x = 1

func heavy_attack_arts():
	if PGS.Current_Equipped == "celeste":
		var celesteheavy = preload("res://Effects/WeaponEffects/Celeste/CelesteHeavyDust.tscn").instance()
		get_tree().current_scene.add_child(celesteheavy)
		celesteheavy.global_position = global_position

func _slamtravel():
		$"../HemwickSword/CharacterEffects/SlamTravelDust/AnimationPlayer".play("Start")







