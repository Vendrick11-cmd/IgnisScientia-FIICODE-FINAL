extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func start():
	var AddInventory = preload("res://Misc/InventoryAddItem.tscn").instance()

	InventoryAdd.get_child(0).add_child(AddInventory)

