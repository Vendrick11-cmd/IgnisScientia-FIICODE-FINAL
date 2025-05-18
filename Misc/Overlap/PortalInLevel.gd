extends Area2D

export var GoToName = "Portal"
export var posxGoTo = 0
export var posyGoTo = 0
onready var player = get_tree().current_scene.get_node("Hemwick")




func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if $RayCast2D.is_colliding():
		$AnimationPlayer.play("On")
	else:
		$AnimationPlayer.play("Off")

	if $RayCast2D.is_colliding() and Input.is_action_pressed("Interact") :
		$CollisionShape2D.disabled = false
	else :
		$CollisionShape2D.disabled = true


func _on_PortalInLevel_body_entered(_body):
	$CanvasLayer/Black/StartAnim.play("Quit")
	$Timer.start()

	var anim = randi() % 4
	match anim:
		0: $DoorSound.play()
		1: $DoorSound2.play()
		2: $DoorSound3.play()
		3: $DoorSound4.play()




func _on_Timer_timeout():
	player.global_position.x = posxGoTo
	player.global_position.y = posyGoTo


func _on_ActivateArea_body_entered(_body):
	$RayCast2D.enabled = true



func _on_ActivateArea_body_exited(_body):
	$RayCast2D.enabled = false
