extends StaticBody2D

func _ready():
	pass



func _on_Timer_timeout():
	$AnimationPlayer.play("broke")

	$Sprite.visible = false
	$CollisionShape2D.disabled = true
	var VaseRubble = preload("res://Levels/Level1/Sprites/Rubbles/woodRubbleLess.tscn")
	var vaserubble = VaseRubble.instance()
	add_child(vaserubble)
	vaserubble.global_position = global_position






func _on_HurtBox_area_entered(_area):
	if PlayerSkills.Looting == true and PGS.Current_Equipped in PGS.DaggersWeapons:
		$GoldDrop._dropmoneylooting()
	if PGS.LuckI == true:
		$GoldDrop._dropmoneyluckI()
	if PGS.LuckII == true:
		$GoldDrop._dropmoneyluckII()
	else :
		$GoldDrop._dropmoney()
	$Timer.start()
	var anim = randi() % 3
	match anim :
		0:
			$Break1.play()
		1:
			$Break2.play()
		2:
			$Break3.play()

