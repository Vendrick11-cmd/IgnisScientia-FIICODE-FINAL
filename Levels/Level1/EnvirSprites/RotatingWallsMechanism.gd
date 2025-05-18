extends Node2D


var busy = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _rotateanim():
	if $WallStatic.rotation_degrees == 0:
		$WallStatic/AnimationPlayer.play("Vertical")
	else:
		$WallStatic/AnimationPlayer.play("Horizontal")

	if $WallStatic2.rotation_degrees == 0:
		$WallStatic2/AnimationPlayer.play("Vertical")
	else:
		$WallStatic2/AnimationPlayer.play("Horizontal")

	if $WallStatic3.rotation_degrees == 0:
		$WallStatic3/AnimationPlayer.play("Vertical")
	else:
		$WallStatic3/AnimationPlayer.play("Horizontal")

func _busy():
	busy = true

func _not_busy():
	busy = false
