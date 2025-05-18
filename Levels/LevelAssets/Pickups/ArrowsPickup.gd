extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if $Pickup.is_colliding() and Input.is_action_just_pressed("Interact"):
		if PGS.slot1_busy == false:
			PGS.slot1 = "simplearrow"
			PGS.slot1number += 1
			PGS.slot1_busy = true
		elif PGS.slot1_busy == true and PGS.slot1 == "simplearrow":
			PGS.slot1number += 1
		elif PGS.slot1_busy == true:
			pass




