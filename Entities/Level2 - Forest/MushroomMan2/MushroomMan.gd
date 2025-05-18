extends KinematicBody2D

export var TimerNumber = 3
var Hostile = true
var knockback = Vector2.ZERO
var motion = Vector2.ZERO
export var RUNSPEED = 170
export var NORMALSPEED = 60
export var GRAVITY = 25

enum {
	IDLE,
	IDLE2,
	MOVERIGHT,
	MOVELEFT,
	ANGRY
}

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var state_machine = $AnimationTree.get("parameters/playback")

var knockback_dir = Vector2.ZERO
onready var state = IDLE

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true


func _physics_process(delta):
	
		
	match state :
		IDLE : _idle(delta)
		IDLE2 : _idle2(delta)
		MOVERIGHT : _moveright(delta)
		MOVELEFT : _moveleft(delta)
		ANGRY : _angry(delta)
	
	motion.y += GRAVITY
	if motion.y >= 400 :
		motion.y = 400
	
	
	
	motion = move_and_slide(motion)


func _idle(delta) :
	state_machine.travel("Idle")
	motion.x = 0
	var t = Timer.new()
	t.set_wait_time(TimerNumber)
	t.one_shot = true
	self. add_child(t)
	t. start()
	yield(t, "timeout")
	t.queue_free()
	state = MOVERIGHT
	$Character.scale.x = 1

func _idle2(delta) :
	state_machine.travel("Idle")
	motion.x = 0
	var t = Timer.new()
	t.set_wait_time(TimerNumber)
	t.one_shot = true
	self. add_child(t)
	t. start()
	yield(t, "timeout")
	t.queue_free()
	state = MOVELEFT
	$Character.scale.x = -1
	

func _moveright(delta) :
	#$Character.scale.x = 1
	motion.x = NORMALSPEED
	state_machine.travel("walk")
	var t = Timer.new()
	t.set_wait_time(3)
	t.one_shot = true
	self. add_child(t)
	t. start()
	yield(t, "timeout")
	t.queue_free()
	state = IDLE2

func _moveleft(delta) :
	#$Character.scale.x = -1
	motion.x = -NORMALSPEED
	state_machine.travel("walk")
	var t = Timer.new()
	t.set_wait_time(3)
	t.one_shot = true
	self. add_child(t)
	t. start()
	yield(t, "timeout")
	t.queue_free()
	state = IDLE
	



func _angry(delta) :
	pass



func _on_HurtBox_area_entered(area):
	pass


