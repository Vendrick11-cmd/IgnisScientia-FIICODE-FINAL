extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if $InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		$Alchemy/Anim.play("Active")
		PGS.alchemy = true

