extends Node2D

var picked = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):


	if picked == true:
		$AnimationPlayer.play("Picked")



	if $InteractRay.is_colliding() and Input.is_action_just_pressed("Interact"):
		PGS.PickUp = true
		$Timer.start()
		if picked == false:
			PGS.Name = "x3 Bilberry"
			IAdd.start()
			InventoryLoad.billberry += 1
			$InteractRay.enabled = false
			$PickUpArea/CollisionPolygon2D.disabled = true
			picked = true



		var anim = randi() % 3
		match anim:
			0:
				$PickUp.play()
			1:
				$PickUp2.play()
			2:
				$PickUp3.play()


func _on_Timer_timeout():
	$AnimationPlayer.play("Idle")
	$InteractRay.enabled = true
	$PickUpArea/CollisionPolygon2D.disabled = false
	picked = false


