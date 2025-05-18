extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _execution():
	var anim = randi() % 15
	match anim:
		0: $Execution.play()
		1:$Execution2.play()
		2:$Execution3.play()
		3:$Execution4.play()
		4:$Execution5.play()
		5:$Execution6.play()
		6:$Execution7.play()
		7:$Execution8.play()
		8:$Execution9.play()
		9:$Execution10.play()
		10:$Execution11.play()
		11:$Execution12.play()
		12:$Execution13.play()
		13:$Execution14.play()
		14:$Execution15.play()
