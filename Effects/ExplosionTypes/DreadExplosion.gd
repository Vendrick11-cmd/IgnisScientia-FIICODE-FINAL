extends Node2D

onready var player = get_tree().get_nodes_in_group("player")[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FireArea_body_entered(body):
	if body == player:
		PGS.DREAD += 30
func _delete():
	queue_free()
