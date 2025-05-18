extends KinematicBody2D

onready var player = get_tree().get_nodes_in_group("player")[0]
export var SPEED = 160
export var GRAVITY = 25
var motion = Vector2.ZERO


func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)

	if is_on_floor():
		GRAVITY = 25
	elif !is_on_floor():
		GRAVITY += 25
		if GRAVITY > 300:
			GRAVITY = 300


#IN VEHICLE
	if $MineCart/ChangeSpeed.is_colliding():
		PGS.in_vehicle = true
		$REnd.disabled = false
		$LEnd.disabled = false
	else :
		PGS.in_vehicle = false
		$REnd.disabled = true
		$LEnd.disabled = true

	if PGS.in_vehicle == true:
		$MineCart/ChangeSpeed.get_collider().global_position.x = self.global_position.x

	if $MineCart/ChangeSpeed.is_colliding() and Input.is_action_pressed("UP"):
			motion.x -= 1.2
	elif $MineCart/ChangeSpeed.is_colliding() and Input.is_action_pressed("DOwN"):
			motion.x += 1.2



# NOT IN VEHICLE
	if $MineCart/LEFT.is_colliding() and PGS.is_moving == true:
		motion.x += 1.2
		if motion.x > SPEED:
			motion.x = SPEED

	elif $MineCart/RIGHT.is_colliding() and PGS.is_moving == true:
		motion.x -= 1.2
		if motion.x < -SPEED:
			motion.x = -SPEED
	else :
		if motion.x > 0:
			if $MineCart/ChangeSpeed.is_colliding():
				motion.x -= 0.4
				if motion.x < 0:
					motion.x = 0
			else:
				motion.x -= 0.8
				if motion.x < 0:
					motion.x = 0
		elif motion.x < 0:
			if $MineCart/ChangeSpeed.is_colliding():
				motion.x += 0.4
				if motion.x > 0:
					motion.x = 0
			else:
				motion.x += 0.8
				if motion.x > 0:
					motion.x = 0
		else :
			motion.x = 0

# ANIMATIONS
	if motion.x > 0 and Input.is_action_pressed("UP") and $MineCart/ChangeSpeed.is_colliding():
		$MineCart/CartControl/CartControlAnim.play("BreakRight")
	elif motion.x < 0 and Input.is_action_pressed("DOwN") and $MineCart/ChangeSpeed.is_colliding():
		$MineCart/CartControl/CartControlAnim.play("BreakLeft")
	else :
		if $MineCart/CartControl/CartControlAnim.current_animation == "BreakRight":
			$MineCart/CartControl/CartControlAnim.play("BreakRightBack")
		elif $MineCart/CartControl/CartControlAnim.current_animation == "BreakLeft":
			$MineCart/CartControl/CartControlAnim.play("BreakLeftBack")

	if motion.x < 0:
		if motion.x <= -100:
			$MineCart/Cartwheel.rotation_degrees -= 11
			$MineCart/Cartwheel2.rotation_degrees -= 11
		elif motion.x <= -60:
			$MineCart/Cartwheel.rotation_degrees -= 8
			$MineCart/Cartwheel2.rotation_degrees -= 8
		elif motion.x <= -30:
			$MineCart/Cartwheel.rotation_degrees -= 5
			$MineCart/Cartwheel2.rotation_degrees -= 5
		elif motion.x <= -15:
			$MineCart/Cartwheel.rotation_degrees -= 3
			$MineCart/Cartwheel2.rotation_degrees -= 3
		elif motion.x <= -1:
			$MineCart/Cartwheel.rotation_degrees -= 1.5
			$MineCart/Cartwheel2.rotation_degrees -= 1.5

	elif motion.x > 0:
		if motion.x >= 100:
			$MineCart/Cartwheel.rotation_degrees += 11
			$MineCart/Cartwheel2.rotation_degrees += 11
		elif motion.x >= 60:
			$MineCart/Cartwheel.rotation_degrees += 8
			$MineCart/Cartwheel2.rotation_degrees += 8
		elif motion.x >= 30:
			$MineCart/Cartwheel.rotation_degrees += 5
			$MineCart/Cartwheel2.rotation_degrees += 5
		elif motion.x >= 15:
			$MineCart/Cartwheel.rotation_degrees += 3
			$MineCart/Cartwheel2.rotation_degrees += 3
		elif motion.x >= 1:
			$MineCart/Cartwheel.rotation_degrees += 1.5
			$MineCart/Cartwheel2.rotation_degrees += 1.5

#DAMAGE

	if motion.x > 100:
		$DamageAnim.play("DamageR")
	elif motion.x < -100:
		$DamageAnim.play("DamageL")
	else:
		$DamageAnim.play("NoDamage")
