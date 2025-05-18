extends StaticBody2D



onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]






# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.playback_speed = rand_range(0.5,1)
	var anim = randi() % 2
	match anim:
		0:
			$AnimationPlayer.play("Idle")
		1:
			$AnimationPlayer.play("Idle2")




func _physics_process(_delta):
	pass


func _pass():
	$AnimationPlayer.play("Idle2")

func _passagain():
	$AnimationPlayer.play("Idle")

func _caw():
	var anim = randi() % 3
	match anim:
		0:
			$Sprite/Caw.play()
		1:
			$Sprite/Caw2.play()
		2:
			$Sprite/Caw3.play()






func _on_RayCast2D_body_entered(_body):
	$AnimationPlayer.play("FlyAway")
	$AnimationPlayer.playback_speed = 1
	$RayCast2D/CollisionShape2D.disabled = true
	$Queuefree.start()


func _on_Queuefree_timeout():
	queue_free()
