extends Node2D


#var changelevel = preload("res://Levels/Begin/LevelBegin.tscn")

var reticle_fireball = preload("res://Misc/UI elements/Reticles/Fireball_reticle.png")
var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade/Black/StartAnim.play("FadeOut")

	load("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
	preload("res://Misc/Coins/5GoldCoin.tscn")
	preload("res://Misc/Coins/10GoldCoin.tscn")
	preload("res://Misc/Coins/25GoldCoin.tscn")

func _physics_process(delta):
	_dialogues()
	_camera(delta)
	_tutorials()


	if PGS.Current_Equipped in PGS.MagicWeapons or PGS.Current_Equipped in PGS.RangedWeapons:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_fireball)

	elif PGS.in_dialogue == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)

	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)







	if $Misc/IllusionRay.is_colliding() :
		$Misc/Illusion.visible = true
		$Misc/Illusion/PortalCast.enabled = true

	if $Misc/Illusion/PortalCast.is_colliding():
		$Fade/Black/StartAnim.play("Quit")
		PGS.SpawnPosX = 0
		PGS.SpawnPosY = 0
		get_tree().change_scene("res://Levels/Begin/LevelBegin.tscn")

func _dialogues():
	if $Misc/CruxiusDialogue.is_colliding() and Input.is_action_just_pressed("Interact"):
		if DialogueStats.cruxius == false:
			var dialogue_resource = preload("res://Misc/Dialogues/Begin/Cruxius.tres")
			DialogueManager.show_example_dialogue_balloon( "Cruxius", dialogue_resource)
			DialogueStats.cruxius = true
			$Misc/CruxiusDialogue.enabled = false

	if $Dialogues/GraveRandom.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Level1/Graves.tres")
		DialogueManager.show_example_dialogue_balloon( "GraveRandom", dialogue_resource)

	if $Dialogues/GraveGarrick.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Level1/Graves.tres")
		DialogueManager.show_example_dialogue_balloon( "GraveGarrick", dialogue_resource)

	if $Dialogues/GraveHemwick.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Level1/Graves.tres")
		DialogueManager.show_example_dialogue_balloon( "GraveHemwick", dialogue_resource)

	if $Dialogues/GraveRandom2.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Level1/Graves.tres")
		DialogueManager.show_example_dialogue_balloon( "GraveRandom2", dialogue_resource)

	if $Dialogues/GraveRandom3.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Level1/Graves.tres")
		DialogueManager.show_example_dialogue_balloon( "GraveRandom3", dialogue_resource)

	if $Dialogues/DoesNotOpenFrom.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.in_dialogue == false:
		var dialogue_resource = preload("res://Misc/Dialogues/Begin/Inner.tres")
		DialogueManager.show_example_dialogue_balloon( "Doesnotopen", dialogue_resource)

func _camera(delta):
	if PGS.in_dialogue == true:
		$Camera2D.smoothing_enabled = true
		if DialogueStats.talking == "hemwick":
			$Hemwick/RemoteTransform2D.global_position = lerp($Hemwick/RemoteTransform2D.global_position,$Hemwick.global_position, 5 * delta)

		if DialogueStats.talking == "cruxius":
			$Hemwick/RemoteTransform2D.global_position =lerp($Hemwick/RemoteTransform2D.global_position,$NPCs/Cruxius.global_position, 5 * delta)
	else:
		$Hemwick/RemoteTransform2D.global_position = lerp($Hemwick/RemoteTransform2D.global_position,$Hemwick.global_position, 5 * delta)

func _tutorials():
	if $TutorialsRays/BasicMovementTutorial.is_colliding() and PGS.movetut == false:
		$Tutorials.visible = true
		$Tutorials/MoveBasic.visible = true
		$Tutorials/MoveBasic/AnimationPlayer.play("Start")
		$TutorialsRays/BasicMovementTutorial.enabled = false
		PGS.movetut = true

	elif $TutorialsRays/WallJumpTutorial.is_colliding() and PGS.walljumptut == false:
		$Tutorials.visible = true
		$Tutorials/WallJumping.visible = true
		$Tutorials/WallJumping/AnimationPlayer.play("Start")
		$TutorialsRays/WallJumpTutorial.enabled = false
		PGS.walljumptut = true





func _on_Timer_timeout():
	get_tree().change_scene("res://Levels/Level1/SubLevels/Level1-Dungeon/Level1-Dungeon.tscn")


func _on_Load_Last_Saved_Game_pressed():
	get_tree().reload_current_scene()
	PlayerStats.health = PlayerStats.max_health
	PlayerStats.living = PlayerStats.max_living
	PlayerStats.stamina = PlayerStats.max_stamina



