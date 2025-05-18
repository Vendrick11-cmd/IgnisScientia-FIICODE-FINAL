extends KinematicBody2D


var knockback = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("player")[0]
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var state = IDLE
onready var stats = $Stats
var motion = Vector2.ZERO
var facing_right = true
var facing_left = false
var knockback_dir = Vector2.ZERO
export var Hostile = true
var alive = true


export var GRAVITY = 0
export var MAXSPEED = 100

enum {
	IDLE,
	CHASE,
	DIE
}

func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	if alive == true:
		set_physics_process(true)
		state = CHASE
		state_machine.travel("Move")
	else:
		state = DIE



	match state:
		IDLE :
			_idle(delta)
		CHASE :
			_chase(delta)
		DIE :
			_die(delta)

	# DREAD INFLICT ----------------------------------------------------------------------------------------------------------


	# ----------------------------------------------------------------------------------------------------------

	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

func _idle(_delta):
	var player = $PlayerDetectionZone.player
	if player != null:
		state = CHASE
		var anim = randi() % 2
		match anim :
			0:
				$Sounds/Screech.playing = true
			1:
				$Sounds/Screech2.playing = true
	motion.y += GRAVITY
	motion = move_and_slide(motion)
	state_machine.travel("Move")

func _chase(delta):



	var player = $PlayerDetectionZone.player
	state_machine.travel("Move")

	if motion.x < 0 :
		$Ghost.scale.x = -1
	elif motion.x > 0 :
		$Ghost.scale.x = 1

	if player == null :
		state = IDLE

	motion.y += GRAVITY
	motion = move_and_slide(motion)
	if $Ghost.scale.x == 1 :
		facing_right = true
		facing_left = false
	elif $Ghost.scale.x == -1 :
		facing_right = false
		facing_left = true
	if player != null:
		var direction = (player.global_position - global_position).normalized()
		motion = motion.move_toward(direction * MAXSPEED, 70 * delta)
		knockback_dir = direction
	else:
		state = IDLE

	if MAXSPEED >= 100 :
		MAXSPEED = 100

func _die(_delta):

	state_machine.travel("Die")

func _inactive():
	set_physics_process(false)



func _on_HurtBox_area_entered(area):
	$AnimationPlayer.play("Hurt")
	$Stats.health -= area.damage
	if area.global_position.x < $Ghost/HurtBox.global_position.x:
		knockback = Vector2.RIGHT *150
	else:
		knockback = Vector2.LEFT * 150
	if $Stats.health <= 0 :
		alive = false
		$GoldDrop.base_gold_drop = rand_range(0,4)
		$GoldDrop.drop_gold()

		$Sounds/Die.playing = true

	$Sounds/Hit.playing = true
	var anim = randi() % 3
	match anim :
		0:
			$Sounds/Hurt1.playing = true
		1 :
			$Sounds/Hurt2.playing = true
		2 :
			$Sounds/Hurt3.playing = true










func _on_ShieldDetect_area_entered(_area):
	knockback = (global_position - player.global_position) * 20


func _on_Stats_no_health():
	state = DIE



func _on_SoundTimer_timeout():
	var anim = randi() % 2
	match anim :
		0:
			$Sounds/Screech.playing = true
		1:
			$Sounds/Screech2.playing = true





func _on_HitBox_area_entered(_area):
	PGS.DREAD += 15





