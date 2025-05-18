extends KinematicBody2D


export var SPEED = 60
export var GRAVITY = 25
var motion = Vector2.ZERO


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)

	if is_on_floor():
		GRAVITY = 25
	elif !is_on_floor():
		GRAVITY += 25
		if GRAVITY > 300:
			GRAVITY = 300
	
	if $MineCart/LEFT.is_colliding() and PGS.is_moving == true:
		motion.x += 0.8
		if motion.x > SPEED:
			motion.x = SPEED
	elif $MineCart/RIGHT.is_colliding() and PGS.is_moving == true:
		motion.x -= 0.8
		if motion.x < -SPEED:
			motion.x = -SPEED
	else :
		if motion.x > 0:
			motion.x -= 0.8
			if motion.x < 0:
				motion.x = 0
		elif motion.x < 0:
			motion.x += 0.8
			if motion.x > 0:
				motion.x = 0
		else :
			motion.x = 0
				
	if motion.x < 0:
		if motion.x <= -30:
			$MineCart/Cartwheel.rotation_degrees -= 5
			$MineCart/Cartwheel2.rotation_degrees -= 5
		elif motion.x <= -15:
			$MineCart/Cartwheel.rotation_degrees -= 3
			$MineCart/Cartwheel2.rotation_degrees -= 3
		elif motion.x <= -1:
			$MineCart/Cartwheel.rotation_degrees -= 1.5
			$MineCart/Cartwheel2.rotation_degrees -= 1.5
	
	elif motion.x > 0:
		if motion.x >= 30:
			$MineCart/Cartwheel.rotation_degrees += 5
			$MineCart/Cartwheel2.rotation_degrees += 5
		elif motion.x >= 15:
			$MineCart/Cartwheel.rotation_degrees += 3
			$MineCart/Cartwheel2.rotation_degrees += 3
		elif motion.x >= 1:
			$MineCart/Cartwheel.rotation_degrees += 1.5
			$MineCart/Cartwheel2.rotation_degrees += 1.5
	
			
			
func _dropmoney():
	var anim = randi() % 3
	match anim :
		0 :
			var Bronzecoin = preload("res://Misc/Coins/25GoldCoin.tscn")
			var bronzecoin = Bronzecoin.instance()
			get_tree().current_scene.add_child(bronzecoin)
			bronzecoin.global_position = global_position
		1:
			var Bronzecoin2 = preload("res://Misc/Coins/25GoldCoin.tscn")
			var bronzecoin2 = Bronzecoin2.instance()
			get_tree().current_scene.add_child(bronzecoin2)
			bronzecoin2.global_position = global_position
		2 : pass

func _on_HurtBox_area_entered(area):
	$Stats.health -= 1
	if $Stats.health > 0:
		_dropmoney()
	$AnimationPlayer.play("Hit")
