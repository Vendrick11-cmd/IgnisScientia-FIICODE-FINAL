extends Node2D


export var posxGoTo = 0
export var posyGoTo = 0
onready var player = get_tree().current_scene.get_node("Hemwick")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _physics_process(_delta):
	if $TransportRay.is_colliding():
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true

func _on_Timer_timeout():



	player.global_position.x = posxGoTo
	player.global_position.y = posyGoTo


func _on_LevelTransition_body_entered(_body):
	$CanvasLayer/Black/StartAnim.play("Quit")
	$Timer.start()


