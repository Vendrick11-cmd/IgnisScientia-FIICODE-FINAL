extends Node2D

onready var player = get_tree().get_nodes_in_group("player")[0]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	pass

func _spitfire():
	$StaticBody2D/Fire/FireAnim.play("Spit")






func _on_FireArea_body_entered(body):
	if body == player:
		PGS.TEMP += 20
