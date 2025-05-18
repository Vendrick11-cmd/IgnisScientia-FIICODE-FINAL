extends KinematicBody2D


export var SPEED = 200
var motion = Vector2.ZERO
export var GRAVITY = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$AnimationPlayer.play("Idle")


func _physics_process(delta):
	motion = move_and_slide(motion)
	motion.y = GRAVITY
	motion.x = SPEED


func _on_ContactArea_body_entered(body):
	$AnimationPlayer.play("Exting")
	motion.x = 0
	motion.y = 0

func _queuefree() :
	queue_free()


func _on_Timer_timeout():
	$AnimationPlayer.play("Exting")


func _on_ShieldDetect_area_entered(area):
	$AnimationPlayer.play("Exting")
	$HitBox.damage = 0
	motion.x = 0
	motion.y = 0


func _on_HitBox_area_entered(area):
	$AnimationPlayer.play("Exting")
	motion.x = 0
	motion.y = 0
