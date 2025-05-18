extends Node2D

var picked = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if picked > 2:
		queue_free()

	if picked == 1:
		$AnimationPlayer.play("1")
	elif picked == 2:
		$AnimationPlayer.play("2")
	elif picked == 3:
		$AnimationPlayer.play("3")
	elif picked == 4:
		$AnimationPlayer.play("4")
	elif picked == 5:
		$AnimationPlayer.play("5")

	if $InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true

		if picked != 2:
			PGS.Name = "x1 Thistle"
			IAdd.start()
			InventoryLoad.thistle += 1
			$InteractRay.enabled = false
			$PickUpArea/CollisionPolygon2D.disabled = true
			$Timer.start()
			picked += 1

		elif picked ==2:
			PGS.Name = "x1 Thistle Seed"
			IAdd.start()
			$InteractRay.enabled = false
			$PickUpArea/CollisionPolygon2D.disabled = true
			InventoryLoad.thistle_seed += 1
			picked += 1

		var anim = randi() % 3
		match anim:
			0:
				$PickUp.play()
			1:
				$PickUp2.play()
			2:
				$PickUp3.play()


func _on_Timer_timeout():
	$InteractRay.enabled = true
	$PickUpArea/CollisionPolygon2D.disabled = false
