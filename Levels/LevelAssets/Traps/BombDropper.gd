extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://Effects/ExplosionTypes/Bomb.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DetectArea_body_entered(body):
	var bomb = preload("res://Effects/ExplosionTypes/Bomb.tscn").instance()
	add_child(bomb)
	bomb.show_behind_parent = true
	bomb.global_position = global_position
	bomb.linear_velocity.x = 0
	bomb.linear_velocity.y = 0

