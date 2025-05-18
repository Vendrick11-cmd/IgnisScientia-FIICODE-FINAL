extends RigidBody2D



onready var motion = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity.x = rand_range(-80,80)
	linear_velocity.y = rand_range(-40, -250)


func _physics_process(_delta):
	if abs(linear_velocity.y) > 2 and abs(linear_velocity.x) > 2:
		$AnimationPlayer.play("Spin")
	else:
		$AnimationPlayer.play("Idle")

	rotation_degrees = 0

	if angular_velocity < 3.5 :
		$CoinBounce.playing = false
		$CoinBounce2.playing = false
		$CoinBounce3.playing = false






func _on_Area2D_body_entered(_body):
	if CharmsInv.has_charm("GoldenEye"):
		PlayerStats.health -= 0.05
	if CharmsInv.has_charm("GrimLedger"):
		CharmsInv.COIN_STRENGTH += 0.005
		CharmsInv.COIN_HEALTH_MINUS += 0.015

	PGS.coins += 1
	$Sprite.visible = false
	$Timer.start()
	$PickUp.playing = true



func _on_Timer_timeout():
	queue_free()


func _on_BounceArea_body_entered(_body):
	linear_damp += 2
	var anim = randi() % 3
	match anim :
		0 : $CoinBounce.playing = true
		1 : $CoinBounce2.playing = true
		2 : $CoinBounce3.playing = true




func _on_CanBePicked_timeout():
	$Area2D/CollisionShape2D.disabled = false
	$Area2D.monitorable = true
	$Area2D.monitoring = true



