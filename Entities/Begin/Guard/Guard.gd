extends StaticBody2D


var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if is_dead == false:
		$AnimationPlayer.play("Idle")


func _on_HurtBox_area_entered(area):
	is_dead = true
	$AnimationPlayer.play("Die")
