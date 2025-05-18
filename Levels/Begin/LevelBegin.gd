extends Node2D

var reticle_fireball = preload("res://Misc/UI elements/Reticles/Fireball_reticle.png")
var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
var rubble = preload("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
var coin25 =preload("res://Misc/Coins/25GoldCoin.tscn")
var coin10 =preload("res://Misc/Coins/10GoldCoin.tscn")
var coin5 =preload("res://Misc/Coins/5GoldCoin.tscn")

var nextlevel = preload("res://Levels/LevelHollowgrove/Level_Hollowgrove.tscn")

var railanim_on = false
var railanim_onbegin = false
var elevlever = false
var buttonpress = false
var buttonpressgreen = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade/Black/StartAnim.play("FadeOut")
	$WorldEnvironment/EnvirAnim.play("Outside")




func _physics_process(delta):
	_spawnpoints()
	_tutorials()

	if $PORTALS/PortalInLevel8/RayCast2D.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.SpawnPosX = 0
		PGS.SpawnPosY = 0
		get_tree().change_scene_to(nextlevel)
		$Fade/Black/StartAnim.play("Quit")


	if PGS.Current_Equipped in PGS.MagicWeapons or PGS.Current_Equipped in PGS.RangedWeapons:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_fireball)

	elif PGS.in_dialogue == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



	_player_pos()
	_levelanimations()
	_dialogues()
	_weapons()
	_camera(delta)

#DEBUG------------------------------------------------------------------------------------------------------------------



#LEVEL------------------------------------------------------------------------------------------------------------------
func _weapons():
	pass

func _player_pos():

	if $Hemwick.global_position.y <= -500 :
		$WorldEnvironment/EnvirAnim.play("Outside")
	elif $Hemwick.global_position.y >= 300 :
		$WorldEnvironment/EnvirAnim.play("Inside")

func _camera(delta):
	if PGS.in_dialogue == true:
		$Camera2D.smoothing_enabled = true
		if DialogueStats.talking == "hemwick":
			$Hemwick/RemoteTransform2D.global_position = lerp($Hemwick/RemoteTransform2D.global_position,$Hemwick.global_position, 5 * delta)


		if DialogueStats.talking == "willy":
			$Hemwick/RemoteTransform2D.global_position =lerp($Hemwick/RemoteTransform2D.global_position,$BackgroundSprites/S2/Bartender.global_position, 5 * delta)
	else:
		$Hemwick/RemoteTransform2D.global_position = lerp($Hemwick/RemoteTransform2D.global_position,$Hemwick.global_position, 5 * delta)

func _levelanimations():
	if $FrontSprites/Rails2/Rail4/RailControl/ControlChange.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_vehicle == false\
	and railanim_on == false and !$FrontSprites/Rails2/Rail4/RailAnim.current_animation == "Off":
			$FrontSprites/Rails2/Rail4/RailAnim.play("On")
			railanim_on = true
	elif $FrontSprites/Rails2/Rail4/RailControl/ControlChange.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_vehicle == false\
	and railanim_on == true and !$FrontSprites/Rails2/Rail4/RailAnim.current_animation == "On" :
		$FrontSprites/Rails2/Rail4/RailAnim.play("Off")
		railanim_on = false

	if $FrontSprites/Rails2/RailControl2/ControlChange.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_vehicle == false\
	and railanim_on == false and !$FrontSprites/Rails2/Rail4/RailAnim.current_animation == "Off":
			$FrontSprites/Rails2/Rail4/RailAnim.play("On")
			railanim_on = true
	elif $FrontSprites/Rails2/RailControl2/ControlChange.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_vehicle == false\
	and railanim_on == true and !$FrontSprites/Rails2/Rail4/RailAnim.current_animation == "On" :
		$FrontSprites/Rails2/Rail4/RailAnim.play("Off")
		railanim_on = false

	if $FrontSprites/ElevatorLever/LeverRay.is_colliding() and Input.is_action_just_pressed("Interact") and elevlever == false\
	and !$FrontSprites/ElevatorLever/ElevAnim.current_animation == "Up":
		$FrontSprites/ElevatorLever/ElevAnim.play("Down")
		elevlever = true
	elif $FrontSprites/ElevatorLever/LeverRay.is_colliding() and Input.is_action_just_pressed("Interact") and elevlever == true\
	and !$FrontSprites/ElevatorLever/ElevAnim.current_animation == "Down":
		$FrontSprites/ElevatorLever/ElevAnim.play("Up")
		elevlever = false

	if $FrontSprites/Rails/RailControl/ControlChange.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_vehicle == false\
	and railanim_onbegin == false and !$FrontSprites/Rails/Rail9/RailAnim.current_animation == "Off":
		$FrontSprites/Rails/Rail9/RailAnim.play("On")
		railanim_onbegin = true
	elif $FrontSprites/Rails/RailControl/ControlChange.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_vehicle == false\
	and railanim_onbegin == true and !$FrontSprites/Rails/Rail9/RailAnim.current_animation == "On":
		$FrontSprites/Rails/Rail9/RailAnim.play("Off")
		railanim_onbegin = false

	if $FrontSprites/Rails2/Button/ButtonDetect.is_colliding() and !$FrontSprites/Rails2/Button/ButtonAnim.current_animation == "NotPressed"\
	and buttonpress == false:
		$FrontSprites/Rails2/Button/ButtonAnim.play("Pressed")
		buttonpress = true
	elif !$FrontSprites/Rails2/Button/ButtonDetect.is_colliding() and !$FrontSprites/Rails2/Button/ButtonAnim.current_animation == "Pressed"\
	and buttonpress == true:
		$FrontSprites/Rails2/Button/ButtonAnim.play("NotPressed")
		buttonpress = false

	if $FrontSprites/Rails/Rail9/Button2/ButtonDetect.is_colliding() and !$FrontSprites/Rails/Rail9/Button2/ButtonAnim.current_animation == "NotPressed"\
	and buttonpressgreen == false:
		$FrontSprites/Rails/Rail9/Button2/ButtonAnim.play("Pressed")
		buttonpressgreen = true
	elif !$FrontSprites/Rails/Rail9/Button2/ButtonDetect.is_colliding() and !$FrontSprites/Rails/Rail9/Button2/ButtonAnim.current_animation == "Pressed"\
	and buttonpressgreen == true:
		$FrontSprites/Rails/Rail9/Button2/ButtonAnim.play("NotPressed")
		buttonpressgreen = false

func _tutorials():
	if $TutorialsRays/AttackingTutorial.is_colliding() and PGS.attacktut == false:
		$Tutorials.visible = true
		$Tutorials/Attack.visible = true
		$Tutorials/Attack/AnimationPlayer.play("Start")
		$TutorialsRays/AttackingTutorial.enabled = false
		PGS.attacktut = true

	elif $TutorialsRays/AirAttackTutorial.is_colliding() and PGS.airattacktut == false:
		$Tutorials.visible = true
		$Tutorials/AirAttack.visible = true
		$Tutorials/AirAttack/AnimationPlayer.play("Start")
		$TutorialsRays/AirAttackTutorial.enabled = false
		PGS.airattacktut = true

	elif $TutorialsRays/InventoryTutorial.is_colliding() and PGS.inventorytut == false:
		$Tutorials.visible = true
		$Tutorials/Inventory.visible = true
		$Tutorials/Inventory/AnimationPlayer.play("Start")
		$TutorialsRays/InventoryTutorial.enabled = false
		PGS.inventorytut = true

	elif $TutorialsRays/DreadTutorial.is_colliding() and PGS.dreadtut == false:
		$Tutorials.visible = true
		$Tutorials/Dread.visible = true
		$Tutorials/Dread/AnimationPlayer.play("Start")
		$TutorialsRays/DreadTutorial.enabled = false
		PGS.dreadtut = true

func _dialogues():

	if $LevelAreas/InnerDialAreas/Doesnotopen.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Begin/Inner.tres")
		DialogueManager.show_example_dialogue_balloon( "Doesnotopen", dialogue_resource)

	if $LevelAreas/InnerDialAreas/YouShould.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Begin/Inner.tres")
		DialogueManager.show_example_dialogue_balloon( "YouShould", dialogue_resource)


	if $LevelAreas/InnerDialAreas/NoWayBackNow.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/dialogue.tres")
		DialogueManager.show_example_dialogue_balloon( "NoWayBackNow", dialogue_resource)
		$LevelAreas/InnerDialAreas/NoWayBackNow.enabled = false

	if $LevelAreas/InnerDialAreas/Willy.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false and DialogueStats.willy == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Begin/BeginDialogues.tres")
		DialogueManager.show_example_dialogue_balloon( "WillyBartender", dialogue_resource)
		DialogueStats.willy = true
		$LevelAreas/InnerDialAreas/Willy.enabled = false

func _spawnpoints():
	if $SpawnPoints/Spawn.is_colliding():
		PGS.SpawnPosX = 4463.552
		PGS.SpawnPosY = -822.788


func save_game():
	var config = ConfigFile.new()

	var currentlevel = get_tree().current_scene.filename
	config.set_value("Game", "current_level", currentlevel)
	config.set_value("Player", "player_pos_x",$Hemwick.position.x)
	config.set_value("Player", "player_pos_y",$Hemwick.position.y)

	var error = config.save("res://Saves/save.ini")

	if error == OK:
		print("Game Saved")
	else:
		print("Error Saving")






func load_game():
	var config = ConfigFile.new()

	var error = config.load("res://Saves/save.ini")


	if error == OK:
		var saved_level = config.get_value("Game", "current_level")
		$Hemwick.position.x = config.get_value("Player", "player_pos_x",$Hemwick.position.x)
		$Hemwick.position.y = config.get_value("Player", "player_pos_y",$Hemwick.position.y)

		print("Game Loaded")
	else:
		print("Loading Failed")


