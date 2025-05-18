extends KinematicBody2D

var motion = Vector2.ZERO
export var MAXSPEED = 100

func _ready():
	pass

func _physics_process(_delta):
	#motion = move_and_slide_with_snap(motion,Vector2.UP)
	motion = move_and_slide(motion)
	motion.y = MAXSPEED
	motion.x = 0
	$AnimationPlayer.play("Idle")


