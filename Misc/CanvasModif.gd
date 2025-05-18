extends CanvasModulate


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if $DarkLight.is_colliding() or $DarkLight2.is_colliding():
		$AnimationPlayer.play("Dark")

	if $DefaultLight.is_colliding() or $DefaultLight2.is_colliding() or $DefaultLight3.is_colliding():
		$AnimationPlayer.play("Default")

	if $DimLight.is_colliding() or $DimLight2.is_colliding():
		$AnimationPlayer.play("Dim")

	if $Light.is_colliding():
		$AnimationPlayer.play("Light")
