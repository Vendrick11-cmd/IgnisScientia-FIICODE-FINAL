extends RigidBody2D

var motion = Vector2.ZERO
export var GRAVITYFORCE = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("RigidBodies")


func _on_Timer_timeout():
	$Sprite.visible = false

	var VaseRubble = preload("res://Levels/Level1/Sprites/Rubbles/Vase1Rubble.tscn")
	var vaserubble = VaseRubble.instance()
	add_child(vaserubble)
	vaserubble.global_position = global_position
	$GoldDrop.drop_gold()


func _on_CrashArea_body_entered(_body):
	if GRAVITYFORCE > 200 :
		$AnimationPlayer.play("Hit")
		$Timer.start()




func _on_CrashArea_body_exited(_body):
	GRAVITYFORCE += 250



	var anim = randi() % 5
	match anim :
		0 :
			var Goldcoin = preload("res://Misc/Coins/25GoldCoin.tscn")
			var goldcoin = Goldcoin.instance()
			var main = get_tree().current_scene
			main.call_deferred("add_child", goldcoin)
			goldcoin.global_position = global_position
		1 :
			var Silvercoin = preload("res://Misc/Coins/10GoldCoin.tscn")
			var silvercoin = Silvercoin.instance()
			var main = get_tree().current_scene
			main.call_deferred("add_child", silvercoin)
			silvercoin.global_position = global_position
		2 :
			var Bronzecoin = preload("res://Misc/Coins/5GoldCoin.tscn")
			var bronzecoin = Bronzecoin.instance()
			var main = get_tree().current_scene
			main.call_deferred("add_child", bronzecoin)
			bronzecoin.global_position = global_position
		3 :
			var Bronzecoin = preload("res://Misc/Coins/5GoldCoin.tscn")
			var bronzecoin = Bronzecoin.instance()
			var main = get_tree().current_scene
			main.call_deferred("add_child", bronzecoin)
			bronzecoin.global_position = global_position

			var Silvercoin = preload("res://Misc/Coins/10GoldCoin.tscn")
			var silvercoin = Silvercoin.instance()
			main.call_deferred("add_child", silvercoin)
			silvercoin.global_position = global_position

		4 :
			var Bronzecoin = preload("res://Misc/Coins/5GoldCoin.tscn")
			var bronzecoin = Bronzecoin.instance()
			var main = get_tree().current_scene
			main.call_deferred("add_child", bronzecoin)
			bronzecoin.global_position = global_position

			var Silvercoin = preload("res://Misc/Coins/10GoldCoin.tscn")
			var silvercoin = Silvercoin.instance()
			main.call_deferred("add_child", silvercoin)
			silvercoin.global_position = global_position


func _on_HurtBox_area_entered(_area):
	$AnimationPlayer.play("Hit")
	$Timer.start()
