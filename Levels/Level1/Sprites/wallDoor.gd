extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta): 
	if Input.is_action_just_pressed("Interact") and $RayCast2D.is_colliding() and self.visible == true :
		$AnimationPlayer.play("Open")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
