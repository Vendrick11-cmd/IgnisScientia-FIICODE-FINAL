extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")


func _physics_process(delta):
	if $RayCast2D.is_colliding() :
		$AnimationPlayer.play("Enclose")


