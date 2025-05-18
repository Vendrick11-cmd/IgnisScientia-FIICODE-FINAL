extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	var small_rooms = [
	preload("res://Misc/Rooms/SmallRooms/SmallRoom1.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom2.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom3.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom4.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom5.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom6.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom7.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom8.tscn"),
	preload("res://Misc/Rooms/SmallRooms/SmallRoom9.tscn")
	]


	var medium_rooms = []

	for child in get_children():
		if child.has_method("get_room_type"): # Identifies placeholder nodes
			var type = child.get_room_type()
			var room_scene

			match type:
				"small":
					room_scene = small_rooms[randi() % small_rooms.size()]
				"medium":
					room_scene = medium_rooms[randi() % medium_rooms.size()]
				_:
					continue

			var room_instance = room_scene.instance()
			room_instance.position = child.position # keep same position
			add_child(room_instance)
			remove_child(child)
			child.queue_free()



