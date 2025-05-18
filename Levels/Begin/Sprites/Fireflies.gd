extends Node2D

onready var state_machine = $AnimationTree.get("parameters/playback")


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	var rng = randi() % 4
	randomize()

	match rng:
		0:
			state_machine.travel("Fly")
			print(rng)
		1:
			state_machine.travel("Fly2")
			print(rng)
		2:
			state_machine.travel("Fly3")
			print(rng)
		3:
			state_machine.travel("Fly4")
			print(rng)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():

	var rng = randi() % 4
	randomize()

	match rng:
		0:
			state_machine.travel("Fly")
			print(rng)
		1:
			state_machine.travel("Fly2")
			print(rng)
		2:
			state_machine.travel("Fly3")
			print(rng)
		3:
			state_machine.travel("Fly4")
			print(rng)
