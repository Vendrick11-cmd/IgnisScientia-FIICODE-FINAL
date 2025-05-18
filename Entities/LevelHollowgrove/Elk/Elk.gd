extends KinematicBody2D


onready var state_machine = $AnimationTree.get("parameters/playback")
onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]

var motion = Vector2.ZERO
var state = IDLE



var is_facing_left = false


export var push_force = 40
export var WALKSPEED = 30


enum {
	IDLE,
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
		WALK:
			_walk(_delta)

func _idle(_delta):
	motion.x = 0
	_PH()
	state_machine.travel("Idle")




func _walk(_delta):
	_PH()



	if is_facing_left == false:
		$Sprite.scale.x = 0.3
		motion.x = WALKSPEED
	elif is_facing_left == true :
		$Sprite.scale.x = -0.3
		motion.x = -WALKSPEED

	state_machine.travel("Walk")

func _on_WanderTimer_timeout():
	$WanderTimer.start()
	if state == WALK or state == IDLE:
		var anim = randi() % 2
		match anim:
			0:
				is_facing_left = false
			1:
				is_facing_left = true


func _on_StatesTimer_timeout():
	$StatesTimer.start()
	if state == WALK or state == IDLE:
		var anim = randi() % 2
		match anim:
			0:
				state = IDLE
			1:
				state = WALK


func _PH():


	motion = move_and_slide(motion, Vector2.UP,true,4,0.785398,false)


	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)


