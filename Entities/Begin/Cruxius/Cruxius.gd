extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
var state = IDLE
export var SPEED = 80
var motion = Vector2.ZERO
var knockback_dir = Vector2.ZERO
onready var player = get_tree().get_nodes_in_group("player")[0]


onready var state_machine = $AnimationTree.get("parameters/playback")


enum {
	IDLE,
	MOVE,
	ATTACK
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	match state:
		IDLE:
			_idle(delta)
		MOVE:
			_move(delta)
		ATTACK:
			_attack(delta)




func _idle(_delta):
	motion = move_and_slide(motion)

	state_machine.travel("Idle")

	var playerZone = $Sprite/PlayerDetectionZone.player
	if playerZone in $Sprite/PlayerDetectionZone.get_overlapping_bodies():
		pass

	if DialogueStats.cruxius_dissolve == true:
		state_machine.travel("Dissolve")
		$Vanish.play()




func _move(delta):

	SPEED = 80
	if $Sprite/Attack.is_colliding() :
		state = ATTACK
	else:
		state = MOVE

	motion = move_and_slide(motion)

	var playerZone = $Sprite/PlayerDetectionZone.player
	state_machine.travel("Move")
	if playerZone != null:
		var direction = (player.global_position - global_position).normalized()
		motion = motion.move_toward(direction * 200, 200 * delta)
		knockback_dir = direction
	else:
		state = IDLE






func _attack(_delta):
	motion = move_and_slide(motion)



	var playerZone = $Sprite/PlayerDetectionZone.player
	if playerZone == null:
		state = IDLE

	state_machine.travel("Attack1")
	if player.global_position.x > global_position.x:
		SPEED = -200
	elif player.global_position.x < global_position.x:
		SPEED = 200


func _attack_finish():

	var _playerZone = $Sprite/PlayerDetectionZone.player



	if !$Sprite/Attack.is_colliding():
		state = IDLE
	elif !$Sprite/Attack.is_colliding() and player != null:
		state = MOVE

