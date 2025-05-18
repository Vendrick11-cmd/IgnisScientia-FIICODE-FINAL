extends Node2D


var detecting = false
onready var player = get_tree().get_nodes_in_group("player")[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")


func _physics_process(_delta):
	if $Activate.is_colliding() or $Activate2.is_colliding() or $Activate3.is_colliding() or $Activate4.is_colliding():
		detecting = true

	if detecting == true:
		if $Activate.is_colliding() or $Activate2.is_colliding() or $Activate3.is_colliding() or $Activate4.is_colliding():
			$AnimationPlayer.play("Shoot")


func _shoot():
	if $AnimationPlayer.current_animation != "Reload":
		var Arrow = preload("res://Entities/Hemwick/Bows/Arrows/EnemyArrow.tscn")
		var arrow = Arrow.instance()
		self.add_child(arrow)
		arrow.z_index = 0
		arrow.global_transform = self.global_transform


		if self.scale.x == 1:
			arrow.speed = 500
		else:
			arrow.speed = -500
	else: pass







func _reload():
	detecting = false
	$AnimationPlayer.play("Reload")



func _shootarrowsounds():
	var anim = randi() % 5
	match anim:
		0: $Sounds/BowShoot1.play()
		1: $Sounds/BowShoot2.play()
		2: $Sounds/BowShoot3.play()
		3: $Sounds/BowShoot4.play()
		4: $Sounds/BowShoot5.play()
