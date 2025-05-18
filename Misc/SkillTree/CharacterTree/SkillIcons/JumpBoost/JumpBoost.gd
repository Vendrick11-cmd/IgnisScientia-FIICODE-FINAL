extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if PGS.JumpBoost == true:
		$Button/AnimationPlayer.play("Active")

func _on_Button_mouse_entered():
	if $"../5Combo/Button/AnimationPlayer".current_animation == "Active":
		$Descr.visible = true
		$Button/AnimationPlayer.play("Hover")
	else : pass
	
func _on_Button_mouse_exited():
	if $"../5Combo/Button/AnimationPlayer".current_animation == "Active":
		if !$Button/AnimationPlayer.current_animation == "Click":
			$Button/AnimationPlayer.play("Idle")
			$Descr.visible = false
		else : pass
	else : pass
func _on_Button_pressed():
	if PGS.skill_selector == 0 and PGS.JumpBoost == false :
		if $"../5Combo/Button/AnimationPlayer".current_animation == "Active":
			$Button/AnimationPlayer.play("Click")
			$Descr.visible = false
			PGS.skill_selector = 1
			if PGS.JumpBoost == false:
				$Sure.visible = true
			else : pass
		else : pass
func _on_Yes_pressed():
	PGS.skill_selector = 0
	PGS.JumpBoost = true
	$Sure.visible = false
func _on_No_pressed():
	PGS.skill_selector = 0
	$Button/AnimationPlayer.play("Idle")
	$Sure.visible = false
