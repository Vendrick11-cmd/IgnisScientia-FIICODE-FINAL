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

	$Fade/Black/StartAnim.play("FadeOut")

func _pause():
	PGS.in_dialogue = true

func _unpause():
	PGS.in_dialogue = false

func _talkleft():
	DialogueStats.talkingleft = true

func _talkright():
	DialogueStats.talkingleft = false


func _physics_process(delta):
	_spawnpoints()


	_tutorials()
	_camera_dialogues(delta)
	_chests()
	_weapons()



	if $Hemwick/HemwickSword.scale.x == 1:
		$Camera2D.offset_h = lerp($Camera2D.offset_h, 0.4, 2 * delta)
	if $Hemwick/HemwickSword.scale.x == -1:
		$Camera2D.offset_h = lerp($Camera2D.offset_h, -0.4, 2 * delta)

	_camera()



	if PGS.Current_Equipped in PGS.MagicWeapons or PGS.Current_Equipped in PGS.RangedWeapons:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_fireball)

	elif PGS.in_dialogue == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)

	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



	if $Rays/FlutterRay.is_colliding():
		$Rays/FlutterRay.enabled = false
		$Flutter.play()

func _camera_dialogues(delta):
	if PGS.in_dialogue == true:
		$Camera2D.smoothing_enabled = true
		if DialogueStats.talking == "hemwick":
			$Hemwick/RemoteTransform2D.global_position = lerp($Hemwick/RemoteTransform2D.global_position,$Hemwick.global_position, 5 * delta)

		if DialogueStats.talking == "eleanore":
			$Hemwick/RemoteTransform2D.global_position =lerp($Hemwick/RemoteTransform2D.global_position,$NPCs/Eleanore.global_position, 5 * delta)
	else:
		$Hemwick/RemoteTransform2D.global_position = lerp($Hemwick/RemoteTransform2D.global_position,$Hemwick.global_position, 5 * delta)


func _camera():
	if $Rays/CameraDark.is_colliding():
		$CanvasModulate/AnimationPlayer.play("Darkness")

	elif $Rays/CameraNoDark.is_colliding():
		$CanvasModulate/AnimationPlayer.play("DayNight")

	if $Rays/CameraLimit.is_colliding() :
		$Camera2D.limit_right = 16901.916
		$Camera2D.limit_left = 16382.662
		$Camera2D.limit_top = -10000000
		$Sounds/BirdChirp.stream_paused = true
		$Sounds/Cricket2.stream_paused = true
	if $Rays/CameraLimit2.is_colliding() or $Rays/CameraLimit3.is_colliding() or $Rays/CameraLimit4.is_colliding() :
		$Camera2D.limit_top = -3609.69
		$Camera2D.limit_right = 10000000
		$Camera2D.limit_left = 17494.355
		$Sounds/BirdChirp.stream_paused = true
		$Sounds/Cricket2.stream_paused = true
	if $Rays/CameraLimitNormal8.is_colliding() or $Rays/CameraLimitNormal10.is_colliding() or $Rays/CameraLimitNormal11.is_colliding():
		$Camera2D.limit_right = 10000000
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = -10000000
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $Rays/CameraLimitNormal9.is_colliding():
		$Camera2D.limit_right = 22279.801
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = -10000000
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $Rays/CameraLimitNormal13.is_colliding():
		$Camera2D.limit_right = 10000000
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = 22890.199
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()
		PGS.found_drake = true

	if $Rays/CameraLimitNormal12.is_colliding():
		$Camera2D.limit_right = 20716.074
		$Camera2D.limit_top = -3122.157
		$Camera2D.limit_left = -10000000
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $Rays/CameraLimitHut.is_colliding():
		$Camera2D.limit_top = 421.527
		$Camera2D.limit_left = 634.35
		$Camera2D.limit_right = 1228.661
		$Camera2D.offset_v = -0.6
		$Camera2D.zoom.x = 0.23
		$Camera2D.zoom.y = 0.23
		$Sounds/BirdChirp.stream_paused = true
		$Sounds/Cricket2.stream_paused = true

	if $Rays/CameraLimitNormal.is_colliding():
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = 1918.329
		$Camera2D.limit_right = 4098.573
		$Camera2D.offset_v = -0.45
		$Camera2D.zoom.x = 0.27
		$Camera2D.zoom.y = 0.27
		$Sounds/BirdChirp.stream_paused = false
		$Sounds/Cricket2.stream_paused = false

	elif $Rays/CameraLimitNormal2.is_colliding() :
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = 9494.103
		$Camera2D.limit_right = 11225.592
		$Camera2D.offset_v = -0.45
		$Camera2D.zoom.x = 0.27
		$Camera2D.zoom.y = 0.27
		$Sounds/BirdChirp.stream_paused = false
		$Sounds/Cricket2.stream_paused = false

	elif $Rays/CameraLimitNormal3.is_colliding():
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = -2143.736
		$Camera2D.limit_right = -1244.87
		$Camera2D.offset_v = -0.45
		$Camera2D.zoom.x = 0.27
		$Camera2D.zoom.y = 0.27
		$Sounds/BirdChirp.stream_paused = false
		$Sounds/Cricket2.stream_paused = false

	elif $Rays/CameraLimitNormal4.is_colliding() or $Rays/CameraLimitNormal6.is_colliding():
		$Camera2D.limit_top = 46.183
		$Camera2D.limit_left = 13403.465
		$Camera2D.limit_right = 15489.583
		$Camera2D.offset_v = -0.45
		$Camera2D.zoom.x = 0.27
		$Camera2D.zoom.y = 0.27
		$Sounds/BirdChirp.stream_paused = true
		$Sounds/Cricket2.stream_paused = true

	elif $Rays/CameraLimitNormal5.is_colliding():
		$Camera2D.limit_top = 325.219
		$Camera2D.limit_left = 16151.704
		$Camera2D.limit_right = 16744.766
		$Camera2D.offset_v = -0.45
		$Camera2D.zoom.x = 0.27
		$Camera2D.zoom.y = 0.27
		$Sounds/BirdChirp.stream_paused = true
		$Sounds/Cricket2.stream_paused = true

	elif $Rays/CameraLimitNormal7.is_colliding():
		$Camera2D.limit_top = -10000000
		$Camera2D.limit_left = -10000000
		$Camera2D.limit_right = 10000000
		$Camera2D.offset_v = -0.45
		$Camera2D.zoom.x = 0.27
		$Camera2D.zoom.y = 0.27
		$Sounds/BirdChirp.stream_paused = true
		$Sounds/Cricket2.stream_paused = true

func _chests():
	if $Background2/ItemChest/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true
		PGS.Name = "150x Gold"
		IAdd.start()
		PGS.coins += 150

		PGS.Name = "Health Vial Recipe"
		IAdd.start()
		InventoryLoad.recipepotionhealthvial = true


	if $Background2/ItemChest2/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true
		PGS.Name = "100x Gold"
		IAdd.start()
		PGS.coins += 100

		PGS.Name = "Regeneration Potion Recipe"
		IAdd.start()
		InventoryLoad.recipepotionregenhealth = true

	if $Background2/ItemChest3/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true
		PGS.Name = "100x Gold"
		IAdd.start()
		PGS.coins += 100

		PGS.Name = "Hunting Instinct Tonic Recipe"
		IAdd.start()
		InventoryLoad.recipepotionhunting = true


	if $Background2/ItemChest4/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true
		PGS.Name = "Elixir of Undying Recipe"
		IAdd.start()
		InventoryLoad.recipepotionundyingelixir = true

	if $Background2/ItemChest5/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true
		PGS.Name = "Stamina Potion Recipe"
		IAdd.start()
		InventoryLoad.recipepotionstamina = true


func _tutorials():
	if $TutorialsRays/DodgeDashTutorial.is_colliding() and PGS.dodgetut == false:
		$Tutorials.visible = true
		$Tutorials/DodgeDash.visible = true
		$Tutorials/DodgeDash/AnimationPlayer.play("Start")
		$TutorialsRays/DodgeDashTutorial.enabled = false
		PGS.dodgetut = true

	elif $TutorialsRays/SlamAttackTutorial.is_colliding() and PGS.slamtut == false:
		$Tutorials.visible = true
		$Tutorials/SlamAttack.visible = true
		$Tutorials/SlamAttack/AnimationPlayer.play("Start")
		$TutorialsRays/SlamAttackTutorial.enabled = false
		PGS.slamtut = true

	elif $TutorialsRays/GardeningTutorial.is_colliding() and PGS.gardtut == false:
		$Tutorials.visible = true
		$Tutorials/Gardening.visible = true
		$Tutorials/Gardening/AnimationPlayer.play("Start")
		$TutorialsRays/GardeningTutorial.enabled = false
		PGS.gardtut = true


	elif $TutorialsRays/SkillPointsTutorial.is_colliding() and PGS.skilltut == false:
		$Tutorials.visible = true
		$Tutorials/SkillPoints.visible = true
		$Tutorials/SkillPoints/AnimationPlayer.play("Start")
		$TutorialsRays/SkillPointsTutorial.enabled = false
		PGS.skilltut = true

	elif $TutorialsRays/AirDashTutorial.is_colliding() and PGS.airdashtut == false:
		$Tutorials.visible = true
		$Tutorials/AirDash.visible = true
		$Tutorials/AirDash/AnimationPlayer.play("Start")
		$TutorialsRays/AirDashTutorial.enabled = false
		PGS.airdashtut = true


func _weapons():
	if $LevelControl/Shovel/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		if PGS.Primary != "shovel" and PGS.Secondary != "shovel":

			if PGS.PrimarySelect == true:
				PGS.pickup_weaponprimary = true
				PGS.pickup_weaponsecondary = false
				PGS.Primary = "shovel"
				PGS.Current_Equipped = "shovel"
			elif PGS.PrimarySelect != true:
				PGS.pickup_weaponprimary = false
				PGS.pickup_weaponsecondary = true
				PGS.Secondary = "shovel"
				PGS.Current_Equipped = "shovel"


	elif $LevelControl/Fireball/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		if PGS.Primary != "fireball" and PGS.Secondary != "fireball" :

			if PGS.PrimarySelect == true:
				PGS.pickup_weaponprimary = true
				PGS.pickup_weaponsecondary = false
				PGS.Primary = "fireball"
				PGS.Current_Equipped = "fireball"

			elif PGS.PrimarySelect != true:
				PGS.pickup_weaponprimary = false
				PGS.pickup_weaponsecondary = true
				PGS.Secondary = "fireball"
				PGS.Current_Equipped = "fireball"



	elif $LevelControl/Celeste/InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		if PGS.Primary != "celeste" and PGS.Secondary != "celeste" :

			if PGS.PrimarySelect == true:
				PGS.pickup_weaponprimary = true
				PGS.pickup_weaponsecondary = false
				PGS.Primary = "celeste"
				PGS.Current_Equipped = "celeste"

			elif PGS.PrimarySelect != true:
				PGS.pickup_weaponprimary = false
				PGS.pickup_weaponsecondary = true
				PGS.Secondary = "celeste"
				PGS.Current_Equipped = "celeste"

	else:
		PGS.pickup_weaponprimary = false
		PGS.pickup_weaponsecondary = false

func _spawnpoints():

	if $SpawnPoints/Spawn.is_colliding():
		PGS.SpawnPosX = 981.393
		PGS.SpawnPosY = 608.986
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $SpawnPoints/Spawn2.is_colliding():
		PGS.SpawnPosX = 14883.409
		PGS.SpawnPosY = 70.845
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $SpawnPoints/Spawn3.is_colliding():
		PGS.SpawnPosX = 16398.768
		PGS.SpawnPosY = -2957.145
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $SpawnPoints/Spawn4.is_colliding():
		PGS.SpawnPosX = 17811.912
		PGS.SpawnPosY = -3539.81
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $SpawnPoints/Spawn5.is_colliding():
		PGS.SpawnPosX = 20146.967
		PGS.SpawnPosY = -3898.735
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

	if $SpawnPoints/Spawn6.is_colliding():
		PGS.SpawnPosX = 23017.275
		PGS.SpawnPosY = -3361.104
		$Sounds/BirdChirp.stop()
		$Sounds/Cricket.stop()
		$Sounds/NightFrogs.stop()
		$Sounds/Cricket2.stop()

func _on_CatArea_body_entered(_body):
	var anim = randi() % 9
	match anim:
		0:
			$NPCs/WitchCat.global_position.x = 883.796
			$NPCs/WitchCat.global_position.y = 621.797
		1:
			$NPCs/WitchCat.global_position.x = 1067.23
			$NPCs/WitchCat.global_position.y = 605.607
		2:
			$NPCs/WitchCat.global_position.x = 796.484
			$NPCs/WitchCat.global_position.y = 529.302
		3:
			$NPCs/WitchCat.global_position.x = 1047.398
			$NPCs/WitchCat.global_position.y = 526.099
		4:
			$NPCs/WitchCat.global_position.x = 949.669
			$NPCs/WitchCat.global_position.y = 507.403
		5:
			$NPCs/WitchCat.global_position.x = 859.109
			$NPCs/WitchCat.global_position.y = 526.714
		6 :
			$NPCs/WitchCat.global_position.x = 859.894
			$NPCs/WitchCat.global_position.y = 590.18
		7:
			$NPCs/WitchCat.global_position.x = 797.121
			$NPCs/WitchCat.global_position.y = 605.298
		8:
			$NPCs/WitchCat.global_position.x = 1044.75
			$NPCs/WitchCat.global_position.y = 620.52



func _on_CameraPanToRight_body_entered(_body):
	$Camera2D/AnimationPlayer.play("PanRight")


func _on_CameraPanToRight_body_exited(_body):
	$Camera2D/AnimationPlayer.play("NormalRight")
	$Rays/CameraPanToRight/CollisionShape2D.disabled = true
