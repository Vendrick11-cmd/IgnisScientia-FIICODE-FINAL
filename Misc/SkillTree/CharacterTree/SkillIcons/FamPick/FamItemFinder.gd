extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if PGS.FamItemFinder == true:
		$Button/AnimationPlayer.play("Active")

func _on_Button_mouse_entered():
	if $"../FamParrot/Button/AnimationPlayer".current_animation == "Active" or\
	$"../FamRaven/Button/AnimationPlayer".current_animation == "Active" or \
	$"../FamWolf/Button/AnimationPlayer".current_animation == "Active" or \
	$"../FamCat/Button/AnimationPlayer".current_animation == "Active":
		if PGS.FamiliarUnlocked == true:
			$Descr.visible = true
			$Button/AnimationPlayer.play("Hover")
		else : pass
	
func _on_Button_mouse_exited():
	if $"../FamParrot/Button/AnimationPlayer".current_animation == "Active" or\
	$"../FamRaven/Button/AnimationPlayer".current_animation == "Active" or \
	$"../FamWolf/Button/AnimationPlayer".current_animation == "Active" or \
	$"../FamCat/Button/AnimationPlayer".current_animation == "Active":
		if PGS.FamiliarUnlocked == true:
			if !$Button/AnimationPlayer.current_animation == "Click":
				$Button/AnimationPlayer.play("Idle")
				$Descr.visible = false
			else : pass
		else : pass
func _on_Button_pressed():
	if $"../FamParrot/Button/AnimationPlayer".current_animation == "Active" or\
	$"../FamRaven/Button/AnimationPlayer".current_animation == "Active" or \
	$"../FamWolf/Button/AnimationPlayer".current_animation == "Active" or \
	$"../FamCat/Button/AnimationPlayer".current_animation == "Active":
		if PGS.skill_selector == 0 and PGS.FamItemFinder == false :
			if PGS.FamiliarUnlocked == true:
				$Button/AnimationPlayer.play("Click")
				$Descr.visible = false
				PGS.skill_selector = 1
				if PGS.FamItemFinder == false:
					$Sure.visible = true
				else : pass
			else : pass
func _on_Yes_pressed():
	PGS.skill_selector = 0
	PGS.FamItemFinder = true
	$Sure.visible = false
func _on_No_pressed():
	PGS.skill_selector = 0
	$Button/AnimationPlayer.play("Idle")
	$Sure.visible = false
