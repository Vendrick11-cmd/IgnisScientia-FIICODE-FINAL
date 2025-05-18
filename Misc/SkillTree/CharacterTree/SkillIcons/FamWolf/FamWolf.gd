extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


	

#FamWolf
func _on_SkillButton_mouse_entered():
	if $Hover/YesNo/Activate.visible == false and PGS.active_skill == false:
		$SkillButton/Skill/AnimationPlayer.play("Hover")
	if PGS.FamWolf == true and PGS.active_skill == false:
		$SkillButton/Skill/AnimationPlayer.play("ActiveHover")
		
func _on_SkillButton_mouse_exited():
	if !$SkillButton/Skill/AnimationPlayer.current_animation == "Click" and PGS.FamWolf == false and $Hover/YesNo/Activate.visible == false and PGS.active_skill == false:
		$SkillButton/Skill/AnimationPlayer.play("Idle")
	if PGS.FamWolf == true:
		$SkillButton/Skill/AnimationPlayer.play("Active")
		
func _on_SkillButton_pressed():
	if PGS.has_found_pet == true and PGS.FamCat == false and PGS.FamParrot == false and PGS.FamRaven == false:
		PGS.active_skill = true
		if PGS.skill_selector == 0 and PGS.FamWolf == false:
			$SkillButton/Skill/AnimationPlayer.play("Click")
			PGS.skill_selector = 1
	
func _on_YesButton_pressed():
	$SkillButton/Skill/AnimationPlayer.play("Active")
	PGS.active_skill = false
	PGS.skill_selector = 0
	PGS.FamWolf = true


func _on_NoButton_pressed():
	PGS.active_skill = false
	PGS.skill_selector = 0
	$SkillButton/Skill/AnimationPlayer.play("Idle")
