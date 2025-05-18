extends Node2D


export(String) var room_type = "small" # or "medium"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_room_type():
	return room_type
