extends KinematicBody2D


var knockback = Vector2.ZERO
const BloodEffect = preload("res://Misc/Overlap/BloodEffect.tscn")
onready var player = get_tree().get_nodes_in_group("player")[0]
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var state = IDLE
onready var stats = $Stats
var motion = Vector2.ZERO
var facing_right = false
var facing_left = false
var knockback_dir = Vector2.ZERO
export var Hostile = true


export var GRAVITY = 0
export var MAXSPEED = 100

enum {
	IDLE,
	CHASE
}

func _ready():
	$AnimationTree.active = true

func _physics_process(delta):

	if $Bat.scale.x == 1 :
		facing_right = true
		facing_left = false
	elif $Bat.scale.x == -1 :
		facing_right = false
		facing_left = true

	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

	if motion.x < 0 :
		$Bat.scale.x = 1
	elif motion.x > 0 :
		$Bat.scale.x = -1

	if state == IDLE:
		motion.y = -60
		motion.x = 0
		if $CeilingDetect.is_colliding() :
			motion.y = -60
			state_machine.travel("Idle")

	if state == CHASE :
		var playerDetect = $PlayerDetectionZone.player
		if playerDetect != null and $HitTimer.time_left == 0:
			var direction = (player.global_position - global_position).normalized()
			motion = motion.move_toward(direction * MAXSPEED, 70 * delta)
			knockback_dir = direction
		elif playerDetect != null and $HitTimer.time_left != 0:
			var direction = (playerDetect.global_position + global_position).normalized()
			motion = motion.move_toward(direction * MAXSPEED, 210 * delta)
			knockback_dir = direction
		elif player == null :
			state = IDLE

	if MAXSPEED >= 100 :
		MAXSPEED = 100


	motion.y += GRAVITY
	motion = move_and_slide(motion)

	if $Detect.is_colliding() :
		$CeilingDetect.enabled = false
		state = CHASE
		state_machine.travel("Move")
	else :
		$CeilingDetect.enabled = true

func _on_HurtBox_area_entered(area):
	if !area.get_parent().is_in_group("Fireball"):
		state_machine.travel("Hurt")
		$Stats.health -= area.damage
		if PGS.Current_Equipped in PGS.MagicWeapons:
			knockback = (global_position - area.global_position) * 4
		elif PGS.Current_Equipped in PGS.RangedWeapons:
			knockback = (global_position - area.global_position) * 5
		else:
			knockback = (global_position - player.global_position) * 8




func _on_Stats_no_health():
	state_machine.travel("Die")
	set_physics_process(false)
	motion.x = 0
	$GoldDrop.base_gold_drop = rand_range(0,5)
	$GoldDrop.drop_gold()





func _on_ShieldDetect_area_entered(_area):
	knockback = (global_position - player.global_position) * 20







func _on_HitBox_area_entered(area):
	if area.get_parent().get_parent() == player:
		PGS.TEMP += 15
	$HitTimer.start()

