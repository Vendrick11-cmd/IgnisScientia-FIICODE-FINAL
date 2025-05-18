extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if PGS.sight == true:
		$Sight/SightButton/Sight/AnimationPlayer.play("Active")


#SIGHT1
func _on_SightButton_mouse_entered():
	if PGS.sight == false:
		$Sight/SightButton/Sight/AnimationPlayer.play("Hover")
	$Sight/SightDescr.visible = true
func _on_SightButton_mouse_exited():
	$Sight/SightDescr.visible = false
	if !$Sight/SightButton/Sight/AnimationPlayer.current_animation == "Click" and PGS.sight == false:
		$Sight/SightButton/Sight/AnimationPlayer.play("Idle")
	else :
		pass
func _on_SightButton_pressed():
	if PGS.skill_selector == 0 and PGS.sight == false:
		$Sight/SightButton/Sight/AnimationPlayer.play("Click")
		PGS.skill_selector = 1

func _on_YesButton_pressed():
	PGS.skill_selector = 0
	PGS.sight = true


func _on_NoButton_pressed():
	PGS.skill_selector = 0
	$Sight/SightButton/Sight/AnimationPlayer.play("Idle")
