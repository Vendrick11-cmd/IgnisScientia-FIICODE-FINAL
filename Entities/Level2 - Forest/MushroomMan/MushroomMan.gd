extends KinematicBody2D


export var Hostile = true
var knockback = Vector2.ZERO
var motion = Vector2.ZERO
export var RUNSPEED = 120
export var NORMALSPEED = 45
export var GRAVITY = 25

enum {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	DIE
}

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var state_machine = $AnimationTree.get("parameters/playback")

var knockback_dir = Vector2.ZERO
onready var state = WANDER

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

	if $Stats.health <= 0 :
		state = DIE

	match state :
		IDLE : _idle(delta)
		WANDER : _wander(delta)
		CHASE : _chase(delta)
		ATTACK : _attack(delta)
		DIE : _die(delta)

	motion.y += GRAVITY
	if motion.y >= 400 :
		motion.y = 400


	motion = move_and_slide(motion, Vector2.UP)


func _idle(_delta) :
	motion.x = 0
	state_machine.travel("Idle")




func _wander(_delta) :
	state_machine.travel("walk")
	if $Character/Misc/WANDERStop.is_colliding():
		if $Character.scale.x == 1:
			$Character.scale.x = -1
		else:
			$Character.scale.x = 1

	if $Character.scale.x == 1:
		motion.x = NORMALSPEED
	else:
		motion.x = -NORMALSPEED







func _on_HurtBox_area_entered(area):
	state = CHASE
	state_machine.travel("Hurt")
	$Stats.health -= area.damage
	knockback = (global_position - player.global_position) * 2.5
	if $Stats.health <= 0 :
		_dropmoney()

func _chase(delta) :
	$IdleMove.stop()
	state_machine.travel("Move")

	var player = $Character/Misc/PlayerDetectionZone.player
	if player != null :
		var direction = (player.global_position - global_position).normalized()
		motion = motion.move_toward(direction * RUNSPEED, 150 * delta)
		knockback_dir = direction
		if player.global_position.x > global_position.x and $Character.scale.x == -1 :
			state_machine.travel("Idle-RunRev")
		elif player.global_position.x < global_position.x and $Character.scale.x == 1 :
			state_machine.travel("Idle-RunRev")
		else :
			state_machine.travel("Move")
	elif player == null :
		state = IDLE
		_ready()


	if motion.x > 0 :
		$Character.scale.x = 1
	elif motion.x < 0 :
		$Character.scale.x = -1

func _attack(_delta) :
	pass


func _die(_delta) :
	state_machine.travel("Die")
	motion.x = 0
	$IdleMove.stop()

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
			pass

func _on_IdleMove_timeout():
	pass

func _attack_finish() :
	state = CHASE

func _on_ShieldDetect_area_entered(_area):
	knockback = (global_position - player.global_position) * 4
	state_machine.travel("ShieldBlocked")
