extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	
func _physics_process(_delta): 
	if $Detect.is_colliding() or $Detect2.is_colliding() :
		if Input.is_action_just_pressed("Interact") and $Occluder.visible == true :
			$AnimationPlayer.play("Open")
		elif Input.is_action_just_pressed("Interact") and $Occluder.visible == false :
			$AnimationPlayer.play("Close")
