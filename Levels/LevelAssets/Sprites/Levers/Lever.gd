extends Node2D


var on = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if $InteractRay.is_colliding() and on == false :
		if Input.is_action_just_pressed("Interact"):
			$AnimationPlayer.play("On")
			on = true
	elif $InteractRay.is_colliding() and on == true :
		if Input.is_action_just_pressed("Interact"):
			$AnimationPlayer.play("Off")
			on = false
