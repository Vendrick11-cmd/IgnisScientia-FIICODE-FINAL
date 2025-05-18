extends RigidBody2D


func _ready():
	add_to_group("RigidBodies")




func _on_Timer_timeout():
	PGS.camera.shake(500,0.5,450)
	$AnimationPlayer.play("broke")






func _on_HurtBox_area_entered(_area):
	$GoldDrop.drop_gold()
	$Timer.start()
	var anim = randi() % 3
	match anim :
		0:
			$Break1.play()
		1:
			$Break2.play()
		2:
			$Break3.play()




func _on_ContactArea_body_entered(_body):
	var anim = randi() % 5
	match anim :
		0: $Contact.play()
		1: $Contact2.play()
		2: $Contact3.play()
		3: $Contact4.play()
		4: $Contact5.play()

func _explode():
	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	var VaseRubble = preload("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
	var vaserubble = VaseRubble.instance()
	add_child(vaserubble)
	vaserubble.global_position = global_position

	var VaseRubble2 = preload("res://Levels/Level1/Sprites/Rubbles/woodRubble.tscn")
	var vaserubble2 = VaseRubble2.instance()
	add_child(vaserubble2)
	vaserubble2.global_position = global_position

	var Expl = preload("res://Effects/ExplosionTypes/DreadExplosion.tscn")
	var expl = Expl.instance()
	get_tree().current_scene.add_child(expl)
	expl.global_position = global_position
