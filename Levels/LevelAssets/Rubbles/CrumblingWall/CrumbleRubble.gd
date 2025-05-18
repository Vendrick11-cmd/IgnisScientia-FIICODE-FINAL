extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$RigidBody2D.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D2.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D2.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D3.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D3.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D4.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D4.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D5.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D5.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D6.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D6.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D7.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D7.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D8.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D8.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D9.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D9.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D10.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D10.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D11.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D11.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D12.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D12.linear_velocity.y = rand_range(0, 50)
	$RigidBody2D13.linear_velocity.x = rand_range(-30, 30)
	$RigidBody2D13.linear_velocity.y = rand_range(0, 50)

	$RigidBody2D.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D2.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D3.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D4.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D5.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D6.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D7.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D8.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D9.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D10.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D11.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D12.rotation_degrees = rand_range(-360, 360)

	$RigidBody2D13.rotation_degrees = rand_range(-360, 360)


func _on_Timer_timeout():
	queue_free()
