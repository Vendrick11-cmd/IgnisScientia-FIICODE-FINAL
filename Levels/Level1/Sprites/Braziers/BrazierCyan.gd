extends Sprite


var lit = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Anim.play("Idle")


func _physics_process(delta):
	if $LightUp.is_colliding() :
		$LightUp.enabled = false
		$Anim.play("TransFire")



func _transanim():
	$Anim.play("Fire")
	lit = true
