extends Node2D

var reticle_fireball = preload("res://Misc/UI elements/Reticles/Fireball_reticle.png")
var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
var rubble1 = preload("res://Levels/Level1/Sprites/Rubbles/Candle/CandleRubble.tscn")
var rubble2 = preload("res://Levels/Level1/Sprites/Rubbles/PaperRubble.tscn")
var rubble3 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
var rubble4 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubbleLess.tscn")
#var level = preload("res://Levels/Begin/LevelBegin.tscn")

onready var player = get_tree().get_nodes_in_group("player")[0]




# Called when the node enters the scene tree for the first time.
func _ready():
	$StartRoom/CameraAnchor/Camera2D.limit_left = $StartRoom/CameraLimits/Left.global_position.x
	$StartRoom/CameraAnchor/Camera2D.limit_top = $StartRoom/CameraLimits/Top.global_position.y
	$StartRoom/CameraAnchor/Camera2D.limit_right = $StartRoom/CameraLimits/Right.global_position.x
	$StartRoom/CameraAnchor/Camera2D.limit_bottom = $StartRoom/CameraLimits/Bottom.global_position.y



func _pause():
	PGS.in_dialogue = true

func _unpause():
	PGS.in_dialogue = false






func _physics_process(delta):

	if $StartRoom/Sprites/IronBars/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		$StartRoom/Sprites/IronBars/AnimationPlayer.play("Up")


	$StartRoom/CameraAnchor.global_position = lerp($StartRoom/CameraAnchor.global_position,$StartRoom/Hemwick.global_position,5 * delta)

	_chests()


	if $StartRoom/Hemwick/HemwickSword.scale.x == 1:
		$StartRoom/CameraAnchor/Camera2D.offset_h = lerp($StartRoom/CameraAnchor/Camera2D.offset_h, 0.4, 2 * delta)
	if $StartRoom/Hemwick/HemwickSword.scale.x == -1:
		$StartRoom/CameraAnchor/Camera2D.offset_h = lerp($StartRoom/CameraAnchor/Camera2D.offset_h, -0.4, 2 * delta)

	#PlayerStats.health = PlayerStats.max_health
	#PlayerStats.stamina = PlayerStats.max_stamina
	#PlayerStats.mana = PlayerStats.max_mana




	if PGS.Current_Equipped in PGS.MagicWeapons or PGS.Current_Equipped in PGS.RangedWeapons:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_fireball)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


	if Input.is_action_just_pressed("Reload"):
		get_tree().reload_current_scene()
		PGS._dread_calc()
		CharmsInv.update_charm_effects()

	if Input.is_action_just_pressed("DOwN"):
		#save_game()
		pass

	if Input.is_action_just_pressed("UP"):
		#load_game()
		pass


	#if $StartRoom/LevelControl/Dagger/DgrRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		#if PGS.Primary != "dagger" and PGS.Secondary != "dagger":

			#if PGS.PrimarySelect == true:
				#PGS.pickup_weaponprimary = true
				#PGS.pickup_weaponsecondary = false
				#PGS.Primary = "dagger"
				#PGS.Current_Equipped = "dagger"
			#elif PGS.PrimarySelect != true:
			#	PGS.pickup_weaponprimary = false
			#	PGS.pickup_weaponsecondary = true
			#	PGS.Secondary = "dagger"
			#	PGS.Current_Equipped = "dagger"
	#else:
		#PGS.pickup_weaponprimary = false
		#PGS.pickup_weaponsecondary = false


func _camera():



	if PGS.in_dialogue == true:
		$StartRoom/CameraAnchor/Camera2D.smoothing_enabled = true
		if DialogueStats.talking == "hemwick":
			$StartRoom/CameraAnchor/Camera2D.global_position = $StartRoom/Hemwick.global_position



		if DialogueStats.talking == "cruxius":
			$StartRoom/Hemwick/RemoteTransform2D.global_position = $StartRoom/NPCs/Cruxius.global_position




func _chests():
	pass



func save_game():
	var config = ConfigFile.new()

	config.set_value("Player", "player_pos_x",$StartRoom/Hemwick.position.x)
	config.set_value("Player", "player_pos_y",$StartRoom/Hemwick.position.y)
	config.set_value("Player", "player_health", PlayerStats.health)
	config.set_value("Player", "player_maxhealth", PlayerStats.max_health)
	config.set_value("Player", "player_stamina", PlayerStats.stamina)
	config.set_value("Player", "player_maxstamina", PlayerStats.max_stamina)
	config.set_value("Player", "player_armor", PlayerStats.armor)
	config.set_value("Player", "player_maxarmor", PlayerStats.max_armor)
	config.set_value("Player", "player_mana", PlayerStats.mana)
	config.set_value("Player", "player_maxmana", PlayerStats.max_mana)
	config.set_value("Player", "Coins", PGS.coins)

	#config.set_value("Ghost2", "ghost2_pos_y",$Enemies/Ghost2.position.y)
	#config.set_value("Ghost2", "ghost2_pos_x",$Enemies/Ghost2.position.x)
	#config.set_value("Ghost2", "ghost2_alive", $Enemies/Ghost2.alive)
	#config.set_value("Ghost2", "ghost2_health", $Enemies/Ghost2/Stats.health)

	var error = config.save("res://Saves/save.ini")
	if error == OK:
		print("Game Saved")
	else:
		print("Error Saving")

func load_game():
	var config = ConfigFile.new()

	var error = config.load("res://Saves/save.ini")
	if error == OK:

		#yield(get_tree().create_timer(1), "timeout")
		player.position.x = config.get_value("Player", "player_pos_x",$StartRoom/Hemwick.position.x)
		player.position.y = config.get_value("Player", "player_pos_y",$StartRoom/Hemwick.position.y)
		PlayerStats.health = config.get_value("Player", "playerhealth", PlayerStats.health)
		PlayerStats.max_health = config.get_value("Player", "player_maxhealth", PlayerStats.max_health)
		PlayerStats.stamina = config.get_value("Player", "player_stamina", PlayerStats.stamina)
		PlayerStats.max_stamina = config.get_value("Player", "player_maxstamina", PlayerStats.max_stamina)
		PlayerStats.armor = config.get_value("Player", "player_armor", PlayerStats.armor)
		PlayerStats.max_armor = config.get_value("Player", "player_maxarmor", PlayerStats.max_armor)
		PlayerStats.mana = config.get_value("Player", "player_mana", PlayerStats.mana)
		PlayerStats.max_mana = config.get_value("Player", "player_maxmana", PlayerStats.max_mana)
		PGS.coins = config.get_value("Player", "Coins", PGS.coins)

		#$Enemies/Ghost2.position.y = config.get_value("Ghost2", "ghost2_pos_y",$Enemies/Ghost2.position.y)
		#$Enemies/Ghost2.position.x = config.get_value("Ghost2", "ghost2_pos_x",$Enemies/Ghost2.position.x)
		#$Enemies/Ghost2.alive = config.get_value("Ghost2", "ghost2_alive", $Enemies/Ghost2.alive)
		#$Enemies/Ghost2/Stats.health = config.get_value("Ghost2", "ghost2_health", $Enemies/Ghost2/Stats.health)
		print("Game Loaded")
	else:
		print("Loading Failed")



