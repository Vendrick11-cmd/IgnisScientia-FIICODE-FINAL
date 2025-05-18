extends KinematicBody2D


export var Hostile = true
var knockback = Vector2.ZERO
var knockback_dir = Vector2.ZERO
var motion = Vector2.ZERO
export var RUNSPEED = 360
export var NORMALSPEED = 60
export var GRAVITY = 50
export var DIRECTION = 1

enum {
	IDLE,
	CHASE,
	ATTACK,
	DIE
}

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var state_machine = $AnimationTree.get("parameters/playback")

onready var state = IDLE


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true
	$Character/Misc/Attack.enabled = true
	$Character/Misc/Attack2.enabled = true
	$Character/Misc/Attack3.enabled = true
	$Character/Misc/Attack4.enabled = true

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)


	if $Stats.health <= 0:
		state = DIE

	motion.y += GRAVITY
	if motion.y >= 400 :
		motion.y = 400


	match state :
		IDLE : _idle(delta)
		CHASE : _chase(delta)
		ATTACK : _attack(delta)
		DIE : _die(delta)




	motion = move_and_slide(motion, Vector2.UP)

func _idle(_delta):
	motion.x = 0
	state_machine.travel("Idle")
	var player = $Character/Misc/PlayerDetectionZone.player
	if player != null:
		state_machine.travel("UnSheathe")
		motion.x = 0


func _chase(_delta) :
	state_machine.travel("Move")

	var player = $Character/Misc/PlayerDetectionZone.player
	if player != null and $Character/Misc/FloorDetect.is_colliding():
		motion.y += GRAVITY
		var direction = (player.global_position - global_position).normalized()
		#motion = motion.move_toward(direction * NORMALSPEED, 150)
		knockback_dir = direction
		if player.global_position.x < global_position.x :
			motion.x = -NORMALSPEED
		elif player.global_position.x > global_position.x:
			motion.x = NORMALSPEED
		state_machine.travel("Move")
	elif player == null :
		state_machine.travel("Sheathe")
		state = IDLE
	elif player == null and !$Character/Misc/FloorDetect.is_colliding():
		if $Character.scale.x == 1:
			motion.x = -NORMALSPEED
			$Character.scale.x = -1
		elif $Character.scale.x == -1:
			motion.x = NORMALSPEED
			$Character.scale.x = 1

	elif player != null and !$Character/Misc/FloorDetect.is_colliding():
		motion.x = 0
		state_machine.travel("Idle")

	elif player == null and $Character/Misc/FloorDetect.is_colliding():
		if $Character.scale.x == 1:
			motion.x = NORMALSPEED
			state_machine.travel("Move")
		elif $Character.scale.x == -1:
			motion.x = -NORMALSPEED
			state_machine.travel("Move")

	if $Character/Misc/Attack.is_colliding() or $Character/Misc/Attack2.is_colliding():
		state = ATTACK
	elif $Character/Misc/Attack3.is_colliding() or $Character/Misc/Attack4.is_colliding():
		if $Character.scale.x == 1:
			$Character.scale.x = -1
			state = ATTACK
		elif $Character.scale.x == -1:
			$Character.scale.x = 1
			state = ATTACK


	if motion.x > 0 :
		$Character.scale.x = 1
	elif motion.x < 0 :
		$Character.scale.x = -1

func _attack(_delta):
	if $Character.scale.x == 1 and $Character/Misc/HitBox/CollisionShape2D.disabled == false:
		motion.x = RUNSPEED
	elif $Character.scale.x == -1 and $Character/Misc/HitBox/CollisionShape2D.disabled == false:
		motion.x = -RUNSPEED
	else :
		motion.x = 0
	var anim = randi() % 3
	match anim :
		0 : state_machine.travel("Attack1")
		1 : state_machine.travel("Attack2")
		2 : state_machine.travel("Attack3")


func _dropmoney() :
	var anim = randi() % 4
	match anim :
		0 :
			var Bronzecoin = preload("res://Misc/Coins/5GoldCoin.tscn")
			var bronzecoin = Bronzecoin.instance()

			add_child(bronzecoin)
			bronzecoin.global_position = global_position

			var bronzecoin2 = Bronzecoin.instance()
			add_child(bronzecoin2)
			bronzecoin2.global_position = global_position

			var bronzecoin3 = Bronzecoin.instance()
			add_child(bronzecoin3)
			bronzecoin3.global_position = global_position

			var bronzecoin4 = Bronzecoin.instance()
			add_child(bronzecoin4)
			bronzecoin4.global_position = global_position
		1 :
			var Bronzecoin = preload("res://Misc/Coins/5GoldCoin.tscn")
			var bronzecoin3 = Bronzecoin.instance()
			add_child(bronzecoin3)
			bronzecoin3.global_position = global_position

			var bronzecoin4 = Bronzecoin.instance()
			add_child(bronzecoin4)
			bronzecoin4.global_position = global_position

			var Silvercoin = preload("res://Misc/Coins/10GoldCoin.tscn")
			var silvercoin = Silvercoin.instance()
			add_child(silvercoin)
			silvercoin.global_position = global_position
		2 :
			var Goldcoin = preload("res://Misc/Coins/25GoldCoin.tscn")
			var goldcoin = Goldcoin.instance()
			add_child(goldcoin)
			goldcoin.global_position = global_position

			var goldcoin2 = Goldcoin.instance()
			add_child(goldcoin2)
			goldcoin2.global_position = global_position

			var goldcoin3 = Goldcoin.instance()
			add_child(goldcoin3)
			goldcoin3.global_position = global_position
		3 :
			var Rand = rand_range(0,100)
			if Rand < 30 :
				var Drop = preload("res://Misc/WeaponChangers/WeaponChangerBoonSword.tscn")
				var drop = Drop.instance()
				add_child(drop)
				drop.global_position = global_position
			else : pass

func _die(_delta):
	_dropmoney()
	state_machine.travel("Die")
	_isdead()

func _unsheate_anim_finished():
	state = CHASE




func _on_Stats_no_health():
	pass # Replace with function body.


func _on_HurtBox_area_entered(area):
	$Stats.health -= area.damage
	$AnimationPlayer.play("Hurt")
	var anim = randi() % 3
	match anim:
		0:
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(3, true)
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(4, false)
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(5, false)
		1:
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(3, false)
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(4, true)
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(5, false)
		2:
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(3, false)
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(4, false)
			$AnimationPlayer.get_animation("Hurt").track_set_enabled(5, true)

func _isdead():
	set_physics_process(false)
	$Character/Misc/HitBox/CollisionShape2D.disabled = true
	$Character/Misc/HurtBox/CollisionShape2D.disabled = true
	$Character/Misc/PlayerDetectionZone/CollisionShape2D.disabled = true
	motion.x = 0
	$CollisionShape2D.disabled = true
	$CollisionShape2D2.disabled = true
