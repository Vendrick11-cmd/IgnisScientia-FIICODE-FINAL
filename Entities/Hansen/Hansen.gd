extends KinematicBody2D

onready var stats = PlayerStats
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]

export var FALLDAMAGE = 0 
export var JUMPFORCE = 400
export var JOGSPEED = 90
export var SIMPLESPEED = 30
export var MAXSPEED = 250
export var ACCELERATION = 350
export var FRICTION = 1800
export var GRAVITY = 25
export var ROLLSPEED = 250
export var ADDITIONAL_FALL_GRAVITY = 6
export var entered_pick_up = false

var is_blocking_left = false
var is_blocking_right = false
var is_facing_left = false
var is_facing_right = false
var motion = Vector2.ZERO
var roll_vectorR = Vector2.RIGHT
var roll_vectorL = Vector2.LEFT
var knockback = Vector2.ZERO
var Hostile = false


enum {
	FIGHT,
	ATTACK
	}
	
var state = FIGHT

		
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationTree.active = true
	
func _physics_process(delta):
	
	
	
	match state : 
		FIGHT: _fight(delta)
		ATTACK: _attack(delta)
		

	
func _fight(delta):
	if Input.is_action_just_pressed("walk") and PGS.walk == false:
		PGS.walk = true
	elif Input.is_action_just_pressed("walk") and PGS.walk == true:
		PGS.walk = false
	
	motion = move_and_slide(motion, Vector2.UP)
	motion.y += GRAVITY
	if motion.y >= 400 :
		motion.y = 400
	
	if Input.is_action_pressed("RIGHT") and PGS.walk == false:
		motion.x = JOGSPEED
		state_machine.travel("THJog")
	elif Input.is_action_pressed("RIGHT") and PGS.walk == true:
		motion.x = SIMPLESPEED
		state_machine.travel("THStep")
		
		
	elif Input.is_action_pressed("LEFT") and PGS.walk == false:
		motion.x = -JOGSPEED
		state_machine.travel("THJog")
	elif Input.is_action_pressed("LEFT") and PGS.walk == true:
		motion.x = -SIMPLESPEED
		state_machine.travel("THStep")
	else : 
		motion.x = 0
		state_machine.travel("THIdle")
	
	if Input.is_action_pressed("RIGHT") and Input.is_action_pressed("Sprint") :
		motion.x = MAXSPEED
		if Input.is_action_pressed("LEFT") :
			motion.x = 0
			state_machine.travel("THIdle")
		else : motion.x = MAXSPEED
		state_machine.travel("THSprint")
	elif Input.is_action_pressed("LEFT") and Input.is_action_pressed("Sprint") :
		if Input.is_action_pressed("RIGHT") :
			motion.x = 0
			state_machine.travel("THIdle")
		else : motion.x = -MAXSPEED
		motion.x = -MAXSPEED
		state_machine.travel("THSprint")
		
	if $Body.scale.x == 1 and Input.is_action_pressed("LEFT"):
		state_machine.travel("THTurnL")
		motion.x = 0
	elif $Body.scale.x == -1 and Input.is_action_pressed("RIGHT"):
		state_machine.travel("THTurnR")
		motion.x = 0
	
	
	if Input.is_action_just_pressed("jump") :
		motion.y = -JUMPFORCE
		state_machine.travel("THJump")
		
	if !is_on_floor() :
		if motion.y < 0 or motion.y == 0 :
			state_machine.travel("THJump")
		if motion.y > 0 :
			state_machine.travel("THFall")
	
	if Input.is_action_just_pressed("LightAttack"):
		state = ATTACK
	
func _attack(delta):
	var anim = randi() % 2
	match anim:
		0: state_machine.travel("AttackL1")
		1: state_machine.travel("AttackL2")
	
	
func _attackfinished():
	state = FIGHT
