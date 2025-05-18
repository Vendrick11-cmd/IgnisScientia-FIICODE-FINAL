extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pass

func _physics_process(_delta):
	if !$Detect.is_colliding() and $Detect.enabled == true:
		$Timer.start()
	else :
		$Timer.stop()



func _on_Timer_timeout():
	$Visual.visible = false
	var VaseRubble = preload("res://Levels/Level1/Sprites/Rubbles/Candle/CandleRubble.tscn")
	var vaserubble = VaseRubble.instance()
	add_child(vaserubble)
	vaserubble.global_position = global_position
	$Detect.enabled = false



