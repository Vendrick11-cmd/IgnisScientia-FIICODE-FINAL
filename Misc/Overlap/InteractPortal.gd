extends Area2D

export var posxGoTo = 0
export var posyGoTo = 0
onready var player = get_tree().current_scene.get_node("Hemwick")




func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if $RayCast2D.is_colliding() and Input.is_action_pressed("Interact") :
		player.global_position.x = posxGoTo
		player.global_position.y = posyGoTo
