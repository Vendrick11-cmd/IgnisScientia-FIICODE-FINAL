extends Node2D


var reticle_fireball = preload("res://Misc/UI elements/Reticles/Fireball_reticle.png")
var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
var rubble1 = preload("res://Levels/Level1/Sprites/Rubbles/Candle/CandleRubble.tscn")
var rubble2 = preload("res://Levels/Level1/Sprites/Rubbles/PaperRubble.tscn")
var rubble3 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
var rubble4 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubbleLess.tscn")


var leveron = true

func _ready():
	pass

func _physics_process(_delta):




	_level_animations()
	_level_dialogues()




func _level_animations():
	pass








func _level_dialogues():
	if DialogueStats.eleanore_fade == true:
		$"../NPCs/Eleanore/Fade".play("Fade")


	if PGS.found_drake == true:
		$Dialogues/Eleanore4.enabled = true


	if $Dialogues/Mirror.is_colliding() and Input.is_action_just_pressed("Interact"):
		var dialogue_resource = preload("res://Misc/Dialogues/Level1 - Dungeon/DungeonInner.tres")
		DialogueManager.show_example_dialogue_balloon( "Mirror", dialogue_resource)
		$Dialogues/Mirror.enabled = false


	if $Dialogues/Vision.is_colliding():
		var dialogue_resource = preload("res://Misc/Dialogues/Level1 - Dungeon/DungeonInner.tres")
		DialogueManager.show_example_dialogue_balloon( "Vision", dialogue_resource)
		$Dialogues/Vision.enabled = false



	if $Dialogues/Gramophone.is_colliding() and Input.is_action_just_pressed("Interact"):
		var dialogue_resource = preload("res://Misc/Dialogues/Level1 - Dungeon/DungeonInner.tres")
		DialogueManager.show_example_dialogue_balloon( "Gramophone", dialogue_resource)
		$Dialogues/Gramophone.enabled = false
		$Dialogues/Gramophone2.enabled = true

	if $Dialogues/Gramophone2.is_colliding() and Input.is_action_just_pressed("Interact"):
		var dialogue_resource = preload("res://Misc/Dialogues/Level1 - Dungeon/DungeonInner.tres")
		DialogueManager.show_example_dialogue_balloon( "Gramophone2", dialogue_resource)

	if $Dialogues/Eleanore.is_colliding() and Input.is_action_just_pressed("Interact"):
		var dialogue_resource = preload("res://Misc/Dialogues/Hollowgrove/Eleanore.tres")
		DialogueManager.show_example_dialogue_balloon( "Eleanore", dialogue_resource)
		$Dialogues/Eleanore.enabled = false
		$Dialogues/Eleanore2.enabled = true

	if $Dialogues/Eleanore2.is_colliding() and Input.is_action_just_pressed("Interact"):
		var dialogue_resource = preload("res://Misc/Dialogues/Hollowgrove/Eleanore.tres")
		DialogueManager.show_example_dialogue_balloon( "EleanoreAfter", dialogue_resource)
		if PGS.harvested == true:
			$Dialogues/Eleanore3.enabled = true
			$Dialogues/Eleanore2.enabled = false



	if $Dialogues/Eleanore3.is_colliding() and Input.is_action_just_pressed("Interact") and  PGS.harvested == true:
		var dialogue_resource = preload("res://Misc/Dialogues/Hollowgrove/Eleanore.tres")
		DialogueManager.show_example_dialogue_balloon( "EleanoreDrake", dialogue_resource)
		$Dialogues/Eleanore3.enabled = false

	if $Dialogues/Eleanore4.is_colliding() and Input.is_action_just_pressed("Interact") and PGS.found_drake == true:
		var dialogue_resource = preload("res://Misc/Dialogues/Hollowgrove/Eleanore.tres")
		DialogueManager.show_example_dialogue_balloon( "EleanoreDrake", dialogue_resource)
		$Dialogues/Eleanore4.enabled = false
		$"../NPCs/DrakeTheHunter".visible = false



	if $Dialogues/Drake.is_colliding() and Input.is_action_just_pressed("Interact"):
		var dialogue_resource = preload("res://Misc/Dialogues/Level1 - Dungeon/DrakeTheHunter.tres")
		DialogueManager.show_example_dialogue_balloon( "DrakeTheHunter", dialogue_resource)
		$Dialogues/Drake.enabled = false

