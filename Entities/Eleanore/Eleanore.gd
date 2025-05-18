extends StaticBody2D


onready var player = get_tree().get_nodes_in_group("player")[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if player.global_position.x > global_position.x :
		$Sprite.scale.x = 1
	elif player.global_position.x < global_position.x:
		$Sprite.scale.x = -1
