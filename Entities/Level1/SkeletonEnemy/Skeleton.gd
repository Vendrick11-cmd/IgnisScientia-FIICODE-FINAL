extends KinematicBody2D


onready var state_machine = $AnimationTree.get("parameters/playback")
onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]
onready var stats = $Stats

var motion = Vector2.ZERO
var state = IDLE
var knockback = Vector2.ZERO
var attackmove = false



var is_facing_left = false


export var push_force = 40
export var WALKSPEED = 20
export var FOLLOWSPEED = 60
export var GRAVITY = 10


enum {
	IDLE,
	WALK,
	FOLLOW,
	ATTACKLIGHT,
	HURT,
	DIE
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true




func _physics_process(delta):
	if $Stats.health <= 0:
		state = DIE


	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

	_PH()

	match state:
		IDLE:
			_idle(delta)
		WALK:
			_walk(delta)
		FOLLOW:
			_follow(delta)
		ATTACKLIGHT:
			_attacklight(delta)
		HURT:
			_hurt(delta)
		DIE:
			_die(delta)

func _idle(_delta):

	$Sprite/PlayerDetect.enabled = true
	motion.x = 0
	_PH()
	state_machine.travel("Idle")

	if $Sprite/PlayerDetect.is_colliding():
		state = FOLLOW




func _walk(_delta):
	$Sprite/PlayerDetect.enabled = true
	_PH()

	if $Sprite/PlayerDetect.is_colliding():
		state = FOLLOW


	if is_facing_left == false and !$Sprite/WallDetect.is_colliding():
		$Sprite.scale.x = 1
		motion.x = WALKSPEED
	elif is_facing_left == true and !$Sprite/WallDetect.is_colliding():
		$Sprite.scale.x = -1
		motion.x = -WALKSPEED


	if is_facing_left == true:
		if $Sprite/WallDetect.is_colliding() or !$Sprite/FloorDetect.is_colliding() :
			$Sprite.scale.x = 1
			motion.x = WALKSPEED
			is_facing_left = false
	elif is_facing_left == false:
		if $Sprite/WallDetect.is_colliding() or !$Sprite/FloorDetect.is_colliding():
			$Sprite.scale.x = -1
			motion.x = -WALKSPEED
			is_facing_left = true

	state_machine.travel("Walk")


func _follow(_delta):
	$Sprite/PlayerDetect.enabled = true

	_PH()


	if player.global_position.x < global_position.x and $Sprite/PlayerDetect.is_colliding() :
		state_machine.travel("Walk")
		$Sprite.scale.x = -1
		motion.x = -WALKSPEED
	elif player.global_position.x > global_position.x and $Sprite/PlayerDetect.is_colliding():
		state_machine.travel("Walk")
		motion.x = WALKSPEED
		$Sprite.scale.x = 1
	else:
		state_machine.travel("Idle")
		motion.x = 0







func _attacklight(_delta):
	$Sprite/PlayerDetect.enabled = false
	motion.x = 0

	var anim = randi() % 3
	match anim:
		0:
			state_machine.travel("AttackLight")
		1:
			state_machine.travel("AttackLight")
		2:
			state_machine.travel("AttackLight")

	if attackmove == true:
		if $Sprite.scale.x == 1:
			motion.x = 150
		else:
			motion.x = -150


func _die(_delta):
	motion.x = 0
	state_machine.travel("Die")
















func _on_WanderTimer_timeout():
	if state == WALK or state == IDLE:
		var anim = randi() % 2
		match anim:
			0:
				is_facing_left = false
			1:
				is_facing_left = true


func _on_StatesTimer_timeout():
	if state == WALK or state == IDLE:
		var anim = randi() % 2
		match anim:
			0:
				state = IDLE
			1:
				state = WALK


func _PH():


	motion.y += GRAVITY
	if motion.y >= 350:
		motion.y = 350

	motion = move_and_slide(motion, Vector2.UP,true,4,0.785398,false)


	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)






func _animfinish():
	state = IDLE

func _attackmovefalse():
	attackmove = false
func _attackmovetrue():
	attackmove = true



func _on_HurtBox_area_entered(area):
	$Stats.health -= area.damage



	$AnimationPlayer.play("Hurt")
	motion.y = -175
	if area.global_position.x < $Sprite/HurtBox.global_position.x:
			knockback = Vector2.RIGHT *125
	else:
			knockback = Vector2.LEFT * 125


	state = HURT


func _hurt(delta):
	state_machine.travel("Hurt")
	knockback = knockback.move_toward(Vector2.UP, 200 * delta)
	knockback = move_and_slide(knockback)










func _on_AttackDetect_body_entered(body):
		state = ATTACKLIGHT
		if body.global_position.x < global_position.x:
			$Sprite.scale.x = -1
		else:
			$Sprite.scale.x = 1


func _on_HitBox_area_entered(_area):
	var anim = randi() % 10
	match anim:
		0:
			$Sprite/Sounds/HitSounds/Hit.play()
		1:
			$Sprite/Sounds/HitSounds/Hit2.play()
		2:
			$Sprite/Sounds/HitSounds/Hit3.play()
		3:
			$Sprite/Sounds/HitSounds/Hit4.play()
		4:
			$Sprite/Sounds/HitSounds/Hit5.play()
		5:
			$Sprite/Sounds/HitSounds/Hit6.play()
		6:
			$Sprite/Sounds/HitSounds/Hit7.play()
		7:
			$Sprite/Sounds/HitSounds/Hit8.play()
		8:
			$Sprite/Sounds/HitSounds/Hit9.play()
		9:
			$Sprite/Sounds/HitSounds/Hit10.play()

func _dierubble():
	var Rubble = preload("res://Levels/LevelAssets/Rubbles/Bones/BoneRubble.tscn")
	var rubble = Rubble.instance()
	get_tree().current_scene.add_child(rubble)
	rubble.global_position = global_position
	$Sprite/Sounds/Die.play()
	$GoldDrop.base_gold_drop = rand_range(0,6)
	$GoldDrop.drop_gold()








