extends RigidBody2D


var motion = Vector2.ZERO
export var speed = 200

func _ready():
	$AnimationPlayer.play("Idle")
	var anim = randi() % 2
	match anim:
		0:
			$Whoosh1.play()
		1:
			$Whoosh2.play()


func _physics_process(delta):
	  position += transform.x * speed * delta


func _destroy():
	queue_free()


func _on_HitBox_area_entered(_area):
	$AnimationPlayer.play("Destroy")
	linear_velocity.x = 0
	linear_velocity.y = 0


func _on_Area2D_body_entered(_body):
	$AnimationPlayer.play("Destroy")
	linear_velocity.x = 0
	linear_velocity.y = 0

