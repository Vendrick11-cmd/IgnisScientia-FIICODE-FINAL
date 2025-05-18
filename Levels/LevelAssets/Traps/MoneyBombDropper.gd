extends StaticBody2D


var count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://Effects/ExplosionTypes/MoneyBomb.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DetectArea_body_entered(body):
	if count == 0:
		var bomb = preload("res://Effects/ExplosionTypes/MoneyBomb.tscn").instance()
		add_child(bomb)
		bomb.global_position = global_position
		bomb.show_behind_parent = true
		bomb.linear_velocity.x = 0
		bomb.linear_velocity.y = 0
	count = 1
