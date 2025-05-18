extends RigidBody2D

var simplearrow = preload("res://Entities/Hemwick/Bows/Arrows/SimpleArrow.png")
var firearrow = preload("res://Entities/Hemwick/Bows/Arrows/FireArrow.png")


var motion = Vector2.ZERO
export var speed = 0
var previous_position = Vector2()
onready var player = get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready():
	if PGS.slot1 == "simplearrow" :
		PGS.arrow_damage = 1
		$ArrowType.play("Simple")

	elif PGS.slot1 == "firearrow" :
		PGS.arrow_damage = 3
		$ArrowType.play("Fire")


	previous_position = global_position
	rotation = 0

func _physics_process(delta):






	global_position += transform.x * speed * delta

	var downward_tilt =  gravity_scale * delta
	if global_position.x > player.global_position.x :
		rotation += downward_tilt /1.25
	else:
		rotation -= downward_tilt *1.25




	if speed <= 0:
		speed = 0

	if speed > 250:
		$Area2D/Fast.disabled = false
		$Area2D/Slow.disabled = true
	elif speed < 250:
		$Area2D/Fast.disabled = true
		$Area2D/Slow.disabled = false



func _on_Area2D_body_entered(_body):
	var anim = randi() % 4
	match anim:
		0: $Sounds/ArrowHitStatic.play()
		1: $Sounds/ArrowHitStatic2.play()
		2: $Sounds/ArrowHitStatic3.play()
		3: $Sounds/ArrowHitStatic4.play()

	$Timer.start()
	$AnimationPlayer.play("NoDamage")
	rotation = 0
	set_physics_process(false)



func _on_Timer_timeout():
	if  !$ColDetect.is_colliding():
		queue_free()






func _on_HitBox_area_entered(_area):
	$AnimationPlayer.play("Hit")
	var anim = randi() % 3
	match anim:
		0: $Sounds/ArrowHit.play()
		1: $Sounds/ArrowHit2.play()
		2: $Sounds/ArrowHit3.play()
