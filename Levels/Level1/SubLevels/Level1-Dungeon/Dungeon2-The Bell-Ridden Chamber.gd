extends Node2D


var reticle_fireball = preload("res://Misc/UI elements/Reticles/Fireball_reticle.png")
var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
var rubble1 = preload("res://Levels/Level1/Sprites/Rubbles/Candle/CandleRubble.tscn")
var rubble2 = preload("res://Levels/Level1/Sprites/Rubbles/PaperRubble.tscn")
var rubble3 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
var rubble4 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubbleLess.tscn")


func _ready():
	pass

func _physics_process(_delta):



	if Input.is_action_just_pressed("DOwN"):
		PlayerStats.health = PlayerStats.max_health

	_level_animations()
	_level_dialogues()
	_camera()

	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()


	if PGS.Current_Equipped in PGS.MagicWeapons or PGS.Current_Equipped in PGS.RangedWeapons:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_fireball)

	elif PGS.in_dialogue == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)

	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



func _level_animations():
	pass

func _camera():
	if $Rays/CameraLimit.is_colliding():
		$Camera2D.limit_left = -316.872
	if $Rays/CameraLimitNormal.is_colliding():
		$Camera2D.limit_right = 10000000
		$Camera2D.limit_top = -10000000




func _level_dialogues():
	pass



