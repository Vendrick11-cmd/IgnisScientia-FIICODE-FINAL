extends KinematicBody2D


onready var state_machine = $AnimationTree.get("parameters/playback")
onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]

var motion = Vector2.ZERO
var state = REST
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
	SHOOT,
	ATTACKLIGHT,
	HURT,
	REST,
	ROLL,
	ROLLALT,
	DIE
}

# Called when the node enters the scene tree for the first time.
func _ready():

	$AnimationTree.active = true
	$Sprite/HostileAnim.play("NonHostile")



func _physics_process(delta):
	if $Stats.health <= 0 :
		state = DIE

	if NpcBehaviour.drakehostile == false:
		$Sprite/HostileAnim.play("NonHostile")
	else:
		$Sprite/HostileAnim.play("Hostile")



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
		SHOOT:
			_shoot(delta)
		ATTACKLIGHT:
			_attacklight(delta)
		HURT:
			_hurt(delta)
		REST:
			_rest(delta)
		ROLL:
			_roll(delta)
		ROLLALT:
			_rollalt(delta)
		DIE:
			_die(delta)

func _idle(_delta):
	motion.x = 0
	_PH()

	if !$ShootDetectR.is_colliding() and !$ShootDetectL.is_colliding() :
		state = IDLE
		state_machine.travel("Idle")
	else:
		state = SHOOT



func _walk(_delta):

	_PH()



	if is_facing_left == false and !$Sprite/WallDetect.is_colliding():
		$Sprite.scale.x = 1
		motion.x = WALKSPEED
	elif is_facing_left == true and !$Sprite/WallDetect.is_colliding():
		$Sprite.scale.x = -1
		motion.x = -WALKSPEED


	if is_facing_left == true and $Sprite/WallDetect.is_colliding():
		$Sprite.scale.x = 1
		motion.x = WALKSPEED
		is_facing_left = false
	elif is_facing_left == false and $Sprite/WallDetect.is_colliding():
		$Sprite.scale.x = -1
		motion.x = -WALKSPEED
		is_facing_left = true

	state_machine.travel("Walk")


func _follow(_delta):


	_PH()


	if player.global_position.x < global_position.x  :
		state_machine.travel("Run")
		$Sprite.scale.x = -1
		motion.x = -FOLLOWSPEED
	elif player.global_position.x > global_position.x:
		state_machine.travel("Run")
		motion.x = FOLLOWSPEED
		$Sprite.scale.x = 1
	else:
		state_machine.travel("Idle")
		motion.x = 0


func _shoot(_delta):
	_PH()

	state_machine.travel("Shoot")

	if $ShootDetectR.is_colliding():
		$Sprite.scale.x = 1

	elif $ShootDetectL.is_colliding():
		$Sprite.scale.x = -1





func _attacklight(_delta):
	motion.x = 0

	var anim = randi() % 3
	match anim:
		0:
			state_machine.travel("AttackLight")
		1:
			state_machine.travel("AttackLight2")
		2:
			state_machine.travel("AttackLight3")

	if attackmove == true:
		pass

func _rest(_delta):
	if $ShootDetectR.is_colliding() or $ShootDetectL.is_colliding() :
		state = SHOOT
	else:
		state = REST

	if NpcBehaviour.drakehostile == false:
		state_machine.travel("Rest")
		motion.x = 0
		$Sprite.scale.x = -1
	else:
		state = IDLE

func _roll(_delta):
	state_machine.travel("Roll")

	if $Sprite.scale.x == 1:
		if $WallDetectCombat.is_colliding():
			motion.x = 160
			$Sprite.scale.x = 1
		else:
			motion.x = -160
			$Sprite.scale.x = -1

	if $Sprite.scale.x == -1:

		if $WallDetectCombat.is_colliding():
			motion.x = -160
			$Sprite.scale.x = -1
		else:
			motion.x = 160
			$Sprite.scale.x = 1

func _rollalt(_delta):

	state_machine.travel("Roll")

	if $Sprite.scale.x == -1:

		if $WallDetectCombat.is_colliding():
			motion.x = 160
			$Sprite.scale.x = 1
		else:
			motion.x = -160
			$Sprite.scale.x = -1

	if $Sprite.scale.x == 1:

		if $WallDetectCombat.is_colliding():
			motion.x = -160
			$Sprite.scale.x = -1
		else:
			motion.x = 160
			$Sprite.scale.x = 1













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




func _arrow():
	$Sprite/Crosshair.rotation_degrees = rand_range(-5,5)
	var Arrow = preload("res://Entities/Hemwick/Bows/Arrows/EnemyArrow.tscn")
	var arrow = Arrow.instance()
	get_tree().current_scene.add_child(arrow)
	arrow.transform = $Sprite/Crosshair/Position2D.global_transform
	arrow.speed = 600

func _animfinish():
	state = IDLE

func _trans_roll():
	var anim = randi() % 2
	match anim:
		0:
			state = ROLL
		1:
			state = ROLLALT



func _on_HurtBox_area_entered(area):
	$Stats.health -= area.damage

	if area.get_parent().get_parent() == player or area.get_parent().is_in_group("player"):
		NpcBehaviour.drakehostile = true

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

func _attackmovefalse():
	attackmove = false
func _attackmovetrue():
	attackmove = true








func _on_AttackDetect_body_entered(body):
	if !state == ROLL or !state == ROLLALT:
		state = ATTACKLIGHT
	if body.global_position.x < global_position.x:
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1


func _on_HitBox_area_entered(_area):
	var anim = randi() % 10
	match anim:
		0:
			$Sprite/Sounds/HitSounds/HitDagger.play()
		1:
			$Sprite/Sounds/HitSounds/HitDagger2.play()
		2:
			$Sprite/Sounds/HitSounds/HitDagger3.play()
		3:
			$Sprite/Sounds/HitSounds/HitDagger4.play()
		4:
			$Sprite/Sounds/HitSounds/HitDagger5.play()
		5:
			$Sprite/Sounds/HitSounds/HitDagger6.play()
		6:
			$Sprite/Sounds/HitSounds/HitDagger7.play()
		7:
			$Sprite/Sounds/HitSounds/HitDagger8.play()
		8:
			$Sprite/Sounds/HitSounds/HitDagger9.play()
		9:
			$Sprite/Sounds/HitSounds/HitDagger10.play()


func _rollsounds():
	var anim = randi() % 3
	match anim:
		0:
			$Sprite/Sounds/Roll/Roll1.play()
		1:
			$Sprite/Sounds/Roll/Roll2.play()
		2:
			$Sprite/Sounds/Roll/Roll3.play()

func _bowdrawsound():
	$Sprite/Sounds/Bow/BowDraw.play()


func _shootarrowsounds():
	var anim = randi() % 5
	match anim:
		0: $Sprite/Sounds/Bow/BowShoot1.play()
		1: $Sprite/Sounds/Bow/BowShoot2.play()
		2: $Sprite/Sounds/Bow/BowShoot3.play()
		3: $Sprite/Sounds/Bow/BowShoot4.play()
		4: $Sprite/Sounds/Bow/BowShoot5.play()

func _die(_delta):
	motion.x = 0
	state_machine.travel("Die")

func _dierubble():
	var Rubble = preload("res://Entities/Level1/DrakeTheHunter/Rubble/DrakeRubble.tscn")
	var rubble = Rubble.instance()
	get_tree().current_scene.add_child(rubble)
	rubble.global_position = global_position
	$GoldDrop._gold()
