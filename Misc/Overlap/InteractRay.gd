extends RayCast2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if  self.is_colliding():
		$AnimationPlayer.play("On")
	else:
		$AnimationPlayer.play("Off")
