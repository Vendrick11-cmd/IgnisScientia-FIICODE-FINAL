extends Node2D


onready var player = get_tree().get_nodes_in_group("player")[0]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	pass


func _on_FireArea_body_entered(_body):
	if $FireArea.get_overlapping_bodies():
		PGS.fire = true
	else :
		PGS.fire = false



func _on_FireArea_body_exited(_body):
	if $FireArea.get_overlapping_bodies():
		PGS.fire = true
	else :
		PGS.fire = false
