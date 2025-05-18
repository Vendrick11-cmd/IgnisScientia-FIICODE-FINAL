extends RigidBody2D


onready var player = get_tree().get_nodes_in_group("player")[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fizzle.pitch_scale = rand_range(0.7,1.3)
	rotation_degrees = rand_range(-30,30)
	linear_velocity.x = rand_range(-80,80)
	linear_velocity.y = rand_range(-200, -300)

func _explode():
	var explosion = preload("res://Effects/Explosion.tscn").instance()
	get_tree().current_scene.add_child(explosion)
	explosion.global_position = global_position
	$GoldDrop.base_gold_drop += rand_range(5,25)
	$GoldDrop.drop_gold()




func _on_Area2D_body_entered(body):
	$AnimationPlayer.play("Start")
	$Impact.pitch_scale = rand_range(0.7,1.3)
	$Impact.play()




func _on_HurtBox_area_entered(area):
	$AnimationPlayer.play("Idle")
	if area.get_parent().global_position.x < global_position.x:
		linear_velocity.x = 250
		linear_velocity.y = -150
	elif area.get_parent().global_position.x > global_position.x:
		linear_velocity.x = -250
		linear_velocity.y = -150
