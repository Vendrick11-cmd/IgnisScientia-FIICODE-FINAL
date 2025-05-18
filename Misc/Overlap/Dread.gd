extends Area2D

var player = null 
export var dread = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func can_see_player():
	return player != null 

func _on_Dread_area_entered(area):
	player = area


func _on_Dread_area_exited(area):
	player = null
