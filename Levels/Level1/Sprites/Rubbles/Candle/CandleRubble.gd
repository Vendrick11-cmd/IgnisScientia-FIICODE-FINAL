extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	$RigidBody2D.linear_velocity.x = rand_range(-200,200)
	$RigidBody2D.linear_velocity.y = rand_range(-40, -200)
	$RigidBody2D.rotation_degrees = rand_range(-200,200)
	$RigidBody2D2.linear_velocity.x = rand_range(-200,200)
	$RigidBody2D2.linear_velocity.y = rand_range(-40, -200)
	$RigidBody2D2.rotation_degrees = rand_range(-200,200)
	$RigidBody2D3.linear_velocity.x = rand_range(-200,200)
	$RigidBody2D3.linear_velocity.y = rand_range(-40, -200)
	$RigidBody2D3.rotation_degrees = rand_range(-200,200)
	$RigidBody2D4.linear_velocity.x = rand_range(-200,200)
	$RigidBody2D4.linear_velocity.y = rand_range(-40, -200)
	$RigidBody2D4.rotation_degrees = rand_range(-200,200)
	$RigidBody2D5.linear_velocity.x = rand_range(-200,200)
	$RigidBody2D5.linear_velocity.y = rand_range(-40, -200)
	$RigidBody2D5.rotation_degrees = rand_range(-200,200)
	$RigidBody2D.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D2.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D3.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D4.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D5.rotation_degrees = rand_range(-360, 360)




func _on_Timer_timeout():
	queue_free()
