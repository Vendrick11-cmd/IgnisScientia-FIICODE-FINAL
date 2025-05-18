extends KinematicBody2D


var knockback = Vector2.ZERO
export var SPEED = 25
export var RUNSPEED = 100
export var ATTACKSPEED = 180
export var GRAVITY = 300
var motion = Vector2.ZERO
export var Hostile = true
var state = IDLE
var knockback_dir = Vector2.ZERO
var leftdir = false
onready var player = get_tree().get_nodes_in_group("player")[0]


onready var state_machine = $AnimationTree.get("parameters/playback")

enum {
	IDLE,
	PACE,
	RUN,
	ATTACK,
	HURT,
	DIE,
	RUNAWAY
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true
	var anim = randi() % 3
	match anim:
		0:
			if state != IDLE:
				state = IDLE
			else:
				state = PACE
				$Sprite.scale.x = 1
		1:
			state = PACE
			$Sprite.scale.x = 1
		2:
			state = PACE
			$Sprite.scale.x = -1


func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

	$Label.text = "%s" % [motion.y]

	match state:
		IDLE:
			_idle(delta)
		PACE:
			_pace(delta)
		RUN:
			_run(delta)
		ATTACK:
			_attack(delta)
		HURT:
			_hurt(delta)
		DIE:
			_die(delta)
		RUNAWAY:
			_runaway(delta)



func _idle(_delta):
	motion.y = GRAVITY
	if motion.y >= 400 :
		motion.y = 400

	motion = move_and_slide(motion, Vector2.UP)
	state_machine.travel("Idle")
	motion.x = 0

	var player = $Sprite/PlayerDetectionZone.player
	if player != null :
		state = RUN




func _pace(_delta):
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)

	if $Sprite.scale.x == 1:
		motion.x = SPEED
	else:
		motion.x = -SPEED

	if $Sprite/WallDetect.is_colliding():
		if $Sprite.scale.x == 1:
			$Sprite.scale.x = -1
		else:
			$Sprite.scale.x = 1

	state_machine.travel("Walk")

	var player = $Sprite/PlayerDetectionZone.player
	if player != null :
		state = RUN



func _run(_delta):
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)


	var direction = (player.global_position - global_position).normalized()
	motion = motion.move_toward(direction * RUNSPEED, 150)
	knockback_dir = direction

	if motion.x < 0 :
		$Sprite.scale.x = -1
		motion.x = -RUNSPEED
	else:
		$Sprite.scale.x = 1
		motion.x = RUNSPEED

	state_machine.travel("Run")




func _attack(_delta):
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)

	state_machine.travel("Attack")

	if motion.x < 0 :
		motion.x = -ATTACKSPEED
	elif motion.x > 0:
		motion.x = ATTACKSPEED




func _hurt(delta):
	state_machine.travel("Hurt")
	knockback = knockback.move_toward(Vector2.UP, 200 * delta)
	knockback = move_and_slide(knockback)










func _die(_delta):
	state_machine.travel("Die")
	set_physics_process(false)
	motion.x = 0
	$Sounds/Bark4.playing = false
	$Sounds/Growl1.playing = false
	$Sounds/Steps.playing = false




func _on_HurtBox_area_entered(area):


	if area.global_position.x < $Sprite/HurtBox.global_position.x and $Sprite.scale.x == -1:
		knockback = Vector2.RIGHT * 150


	elif area.global_position.x < $Sprite/HurtBox.global_position.x and $Sprite.scale.x == 1:
		knockback = Vector2.RIGHT * 150


	elif area.global_position.x > $Sprite/HurtBox.global_position.x and $Sprite.scale.x == 1:
		knockback = Vector2.LEFT * 150

	elif area.global_position.x > $Sprite/HurtBox.global_position.x and $Sprite.scale.x == -1:
		knockback = Vector2.LEFT * 150


	state = HURT
	$Stats.health -= area.damage


	if $Stats.health <= 0 :
		state_machine.travel("Die")
		set_physics_process(false)
		motion.x = 0
		$GoldDrop.base_gold_drop = rand_range(0,3)
		$GoldDrop.drop_gold()



func _on_AttackRay_body_entered(_body):
	var anim = randi() % 2
	match anim:
		0:
			state = ATTACK
		1:
			state = RUNAWAY
			$RetreatTimer.start()


func _attackfinish():
	state = RUN

func _runaway(_delta):

	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)


	var direction = (player.global_position - global_position).normalized()
	motion = motion.move_toward(direction * RUNSPEED, 150)
	knockback_dir = direction


	if motion.x < 0 :
		$Sprite.scale.x = 1
		motion.x = RUNSPEED
		if $Sprite/WallDetect.is_colliding():
			state = RUN
	else:
		$Sprite.scale.x = -1
		motion.x = -RUNSPEED
		if $Sprite/WallDetect.is_colliding():
			state = RUN

	if $Sprite/WallDetect.is_colliding():
		if $Sprite.scale.x == 1:
			$Sprite.scale.x = -1
		else:
			$Sprite.scale.x = 1




	state_machine.travel("Run")



func _on_RetreatTimer_timeout():
	state = RUN
