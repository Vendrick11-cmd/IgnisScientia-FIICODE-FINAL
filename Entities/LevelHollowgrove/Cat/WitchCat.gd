extends KinematicBody2D


onready var state_machine = $AnimationTree.get("parameters/playback")
onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]

var motion = Vector2.ZERO
var state = IDLE



var is_facing_left = false


export var push_force = 40
export var WALKSPEED = 10


enum {
	IDLE,
	IDLE2,
	IDLE3,
	IDLE4,
	IDLE6,
	IDLE8,
	WALK
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true




func _physics_process(_delta):

	_PH()

	match state:
		IDLE:
			_idle(_delta)
		IDLE2:
			_idle2(_delta)
		IDLE3:
			_idle3(_delta)
		IDLE6:
			_idle6(_delta)
		IDLE8:
			_idle8(_delta)
		WALK:
			_walk(_delta)

func _idle(_delta):
	motion.x = 0
	_PH()
	state_machine.travel("Idle")
func _idle2(_delta):
	motion.x = 0
	_PH()
	state_machine.travel("Idle2")
func _idle3(_delta):
	motion.x = 0
	_PH()
	state_machine.travel("Idle3")
	motion.x = 0
func _idle6(_delta):
	motion.x = 0
	_PH()
	state_machine.travel("Idle6")
func _idle8(__delta):
	motion.x = 0
	_PH()
	state_machine.travel("Idle8")


func _walk(__delta):
	if $Sprite/FloorDetect.is_colliding():
		_PH()



		if is_facing_left == false:
			$Sprite.scale.x = 1
			motion.x = WALKSPEED
		elif is_facing_left == true :
			$Sprite.scale.x = -1
			motion.x = -WALKSPEED

		if is_facing_left == true:
			if $Sprite/WallDetect.is_colliding() :
				$Sprite.scale.x = 1
				motion.x = WALKSPEED
				is_facing_left = false
		elif is_facing_left == false:
			if $Sprite/WallDetect.is_colliding():
				$Sprite.scale.x = -1
				motion.x = -WALKSPEED
				is_facing_left = true

		state_machine.travel("Walk")
	else:
		state = IDLE

func _on_WanderTimer_timeout():
	$WanderTimer.start()
	if state == WALK or state == IDLE or state == IDLE2 or state == IDLE3  or state == IDLE6 or state == IDLE8:
		var anim = randi() % 2
		match anim:
			0:
				is_facing_left = false
			1:
				is_facing_left = true


func _on_StatesTimer_timeout():
	$StatesTimer.start()
	if state == WALK or state == IDLE or state == IDLE2 or state == IDLE3 or state == IDLE6 or state == IDLE8:
		var anim = randi() % 6
		match anim:
			0:
				state = IDLE
			1:
				state = WALK
			2:
				state = IDLE2
			3:
				state = IDLE3
			4:
				state = IDLE6
			5:
				state = IDLE8





func _PH():


	motion = move_and_slide(motion, Vector2.UP,true,4,0.785398,false)


	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)

func _meow():
	var anim = randi() % 4
	match anim:
		0:
			$MeowSound.play()
		1:
			$MeowSound2.play()
		2:
			$MeowSound3.play()
		3:
			$MeowSound4.play()

