extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



#ShieldBreaker
func _on_SkillButton_mouse_entered():
	if $Hover/YesNo/Activate.visible == false and PGS.active_skill == false:
		$SkillButton/Skill/AnimationPlayer.play("Hover")
	if PGS.ShieldBreaker == true and PGS.active_skill == false:
		$SkillButton/Skill/AnimationPlayer.play("ActiveHover")
		
func _on_SkillButton_mouse_exited():
	if !$SkillButton/Skill/AnimationPlayer.current_animation == "Click" and PGS.ShieldBreaker == false and $Hover/YesNo/Activate.visible == false and PGS.active_skill == false:
		$SkillButton/Skill/AnimationPlayer.play("Idle")
	if PGS.ShieldBreaker == true:
		$SkillButton/Skill/AnimationPlayer.play("Active")
		
func _on_SkillButton_pressed():
	if PGS.Rage == true:
		PGS.active_skill = true
		if PGS.skill_selector == 0 and PGS.ShieldBreaker == false:
			$SkillButton/Skill/AnimationPlayer.play("Click")
			PGS.skill_selector = 1
	
func _on_YesButton_pressed():
	$SkillButton/Skill/AnimationPlayer.play("Active")
	PGS.active_skill = false
	PGS.skill_selector = 0
	PGS.ShieldBreaker = true


func _on_NoButton_pressed():
	PGS.active_skill = false
	PGS.skill_selector = 0
	$SkillButton/Skill/AnimationPlayer.play("Idle")
