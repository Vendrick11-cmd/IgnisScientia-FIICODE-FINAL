extends Node


onready var drakehostile = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _NPCdrakehostile():
	drakehostile = true

func _NPCdrakepeaceful():
	drakehostile = false
