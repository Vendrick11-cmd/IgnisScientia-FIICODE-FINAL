extends Node2D

onready var player = get_tree().get_nodes_in_group("player")[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	PGS.camera.shake(500,0.5,450)
	$ExplosionSound.pitch_scale = rand_range(0.7,1.3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FireArea_body_entered(body):
	if body == player:
		PGS.TEMP += 25

func _delete():
	queue_free()
