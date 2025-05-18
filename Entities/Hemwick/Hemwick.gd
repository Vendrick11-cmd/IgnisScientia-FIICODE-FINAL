extends KinematicBody2D

export var FALLDAMAGE = 0
export var ATTACKSPEED = 0
export var GRAVITY = 8
export var ROLLSPEED = 250
export var entered_pick_up = false
export var air_attacked = false
export var push_force = 40
export var can_jump_hang = true
export var add_slam_damage = 0

var last_attack = ATTACKLIGHT
var reborn = false
var unleash_revive = false
var bandage_regen = false
var life_steal_on_hit = false
var bloodforged_bonus = false



var motion = Vector2.ZERO
var roll_vectorR = Vector2.RIGHT
var roll_vectorL = Vector2.LEFT
var knockback = Vector2.ZERO
var Hostile = false





enum {
	PICKUP,
	BUFF,
	HEAL,
	ROLLFIGHT,
	FIGHT,
	ATTACKLIGHT,
	ATTACKHEAVY,
	AIRRANGEDATTACK,
	RANGEDATTACK,
	AIRATTACK,
	DASHATTACK,
	AIRATTACKSLAM,
	FIGHTDIE,
	BLOCK,
	BLOCKHIT,
	AIRCOMBO,
	COMBO,
	COMBO2,
	HEAVYCOMBO,
	SPECIAL,
	DASH,
	AIRDASH,
	HANG,
	REVIVE,
	REBIRTH
}

var state = FIGHT
onready var stats = PlayerStats
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var state_machine_bow = $AnimationTree.get("parameters/Bow/playback")
onready var enemies = get_tree().get_nodes_in_group("enemies")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]


func _ready():
	stats.max_health = PGS.default_MAXHEALTH
	stats.health = stats.max_health
	stats.max_stamina = PGS.default_MAXSTAMINA
	PGS.stamina_factor = PGS.default_stamina_factor
	PGS.stamina_factor_charms = PGS.default_stamina_factor_charms
	stats.stamina = stats.max_stamina
	stats.max_mana = PGS.default_MAXMANA
	stats.mana = stats.max_mana
	CharmsInv.COIN_HEALTH_MINUS = 0
	CharmsInv.COIN_STRENGTH = 0
	CharmsInv.MOMENTUM_TIME = 0
	CharmsInv.FINALTOLL_NUMBER = 0
	CharmsInv.FINALTOLL_STRENGTH = 0
	Engine.time_scale = PGS.default_TIMESCALE



#CHARMS RANDOM------------------------------------------------------------
	#CharmsInv.Current_Charm = CharmsInv.Charms_keys[randi() % CharmsInv.Charms_keys.size()]
	CharmsInv.Current_Charms = []
	CharmsInv.update_charm_effects()

	if PGS.SpawnPosX != 0 or PGS.SpawnPosY != 0:
		global_position.x = PGS.SpawnPosX
		global_position.y = PGS.SpawnPosY

#VOLUME EFFECTS------------------------------------------------------------
	$Sounds/Effects/Dread/DreadOff.volume_db = -80
	$Sounds/Effects/Fire/FireOff.volume_db = -80

#MAIN ---------------------------------------------------------------------------------
	$Sounds/Effects/EnterTimer.start()
	$AnimationTree.active = true
	$HemwickSword/ElementDamage/Fire.visible = false
	$GUI/ElementDamage.visible = true






func _process(_delta):



	_sounds()

func _physics_process(delta):

	if state == AIRATTACKSLAM:
		$"../CameraAnchor/Camera2D".offset_v = lerp($"../CameraAnchor/Camera2D".offset_v,0.3,4 * delta)
		$"../CameraAnchor/Camera2D".smoothing_speed = lerp($"../CameraAnchor/Camera2D".smoothing_speed,15,10 * delta)
	else:
		$"../CameraAnchor/Camera2D".offset_v = lerp($"../CameraAnchor/Camera2D".offset_v,-0.3,2 * delta)
		$"../CameraAnchor/Camera2D".smoothing_speed = lerp($"../CameraAnchor/Camera2D".smoothing_speed,10,2 * delta)

	if ATTACKSPEED > 0 :
		ATTACKSPEED = lerp(ATTACKSPEED, 0, delta * 10)
	if ATTACKSPEED <= 0:
		ATTACKSPEED = 0

	if state == AIRATTACKSLAM:
		if !$FloorDetect.is_colliding():
			add_slam_damage += 0.1
		else:
			add_slam_damage += 0


	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	#DEBUG-------------------------------------------------------------------------------------------------------------------------------------
	$DebugStats/VBoxContainer/DaggerDamage/Label4.text = "%s" % [$HemwickSword/HitBox.damage]
	$DebugStats/VBoxContainer/Strength/Label.text = "%s" % [PGS.STRENGTH]
	$DebugStats/VBoxContainer/Jump/Label.text = "%s" % [PGS.JUMPFORCE]
	$DebugStats/VBoxContainer/Speed/Label.text = "%s" % [PGS.MAXSPEED]
	$DebugStats/VBoxContainer/StaminaFactor/Label.text = "%s" % [PGS.stamina_factor]
	$DebugStats/VBoxContainer/Any/Label.text = "%s" % [$"../CameraAnchor/Camera2D".smoothing_speed]
	$DebugStats/VBoxContainer/Health/Label.text = "%s" % [PlayerStats.health]
	$DebugStats/VBoxContainer/TimeScale/Label.text = str(Engine.time_scale)
	$DebugStats/VBoxContainer/FinalTollNumber/Label.text = "%s" % [CharmsInv.FINALTOLL_NUMBER]



	if PGS.Current_Equipped == "bow":
		if  PGS.slot1number > 0:
			$HemwickSword/AdditionalAssets/Arrow.visible = true
			if state == AIRRANGEDATTACK or state == RANGEDATTACK:
				$HemwickSword/AdditionalAssets/Arrow.visible = false
		else :
			$HemwickSword/AdditionalAssets/Arrow.visible = false
	else:
		$HemwickSword/AdditionalAssets/Arrow.visible = false

	if PGS.slot1number > 0:
		PGS.can_shoot = true
	else:
		PGS.can_shoot = false



	#MISC-----------------------------------------------------------------------------------------------------------------------------------
	if CharmsInv.has_charm("Haste"):
		if motion.x == 0:
			stats.health -= 0.005
	if CharmsInv.has_charm("EarthBound"):
		if motion.y == 0:
			PGS.STRENGTH += 0.0005



	if PGS.undying == true:
		$HemwickSword/HurtBox/CollisionShape2D.disabled = true
	else:
		$HemwickSword/HurtBox/CollisionShape2D.disabled = false

	if PGS.invis == true:
		$HemwickSword.visible = false
	else:
		$HemwickSword.visible = true


	if DialogueTimer.time_left == 0:
		PGS.can_attack = true
	else:
		PGS.can_attack = false

	if PGS.in_vehicle or PGS.fire or state == DASH:
		$HemwickSword/TorsoHead.visible = false
	else:
		$HemwickSword/TorsoHead.visible = true

	if $HemwickSword.scale.x == 1:
		$Collision.position.x = 1.1
		$CollisionSlopes2.position.x =1.902
		$CollisionSlopes.position.x = 2.578
	elif $HemwickSword.scale.x == -1:
		$Collision.position.x = -1.1
		$CollisionSlopes2.position.x =-1.257
		$CollisionSlopes.position.x = -0.581

	if $FloorDetect.is_colliding():
		PGS.is_on_floor = true
	else:
		PGS.is_on_floor = false

	if $HemwickSword.scale.x ==1:
		$HemwickSword/Dust/DustAnim.play("RIGHT")
	else:
		$HemwickSword/Dust/DustAnim.play("LEFT")

	if PGS.in_dialogue:
		$GUI.visible = false
	else:
		$GUI.visible = true


	$Crosshair.look_at(get_global_mouse_position())



	if $SlopeDetect.is_colliding() :
		$CollisionSlopes.disabled = false
		$CollisionSlopes2.disabled = false
		$Collision.disabled = true

	else:
		$CollisionSlopes.disabled = true
		$CollisionSlopes2.disabled = true
		$Collision.disabled = false





#ARMS -------------------------------------------------------------------------------------------------------------------



	var sheet_name = PGS.weapons[PGS.Current_Equipped]["sheet"]


	$ArmsChanger.play(sheet_name)


	if state == AIRATTACKSLAM:
		if !$FloorDetect.is_colliding():
			$HemwickSword/HitBox/HitBoxAnim.play("SlamTravel")
		else:
			$HemwickSword/HitBox/HitBoxAnim.play("Slam")



#-------------------------------------------------------------------------------------------------------------------

#BANDAGE REGEN FEATURE -------------------------------------------------------------------------------------------------------
	if bandage_regen == true:
		$HemwickSword/CharacterEffects/BandageHeal/BandageHealAnim.play("Start")
		stats.health += 0.015
#LIFESTEAL FEATURE
	if life_steal_on_hit == true:
		stats.health += 0.01
#MANA REGEN
	if PlayerSkills.ManaRegen == true:
		stats.mana += 0.005
#-------------------------------------------------------------------------------------------------------------------

	if stats.health <= 0 :
		if PGS.SecondChance == true and reborn == false:
			state = REBIRTH
		else :
			state = FIGHTDIE

	if stats.health <= stats.max_health/5 and PGS.Unleash == true and unleash_revive == false:
		state = REVIVE





	if CharmsInv.has_charm("Momentum"):
		PlayerStats.stamina = PlayerStats.max_stamina
	stats.stamina += PGS.stamina_factor
	PlayerStats.health -= PGS.poison_factor
	PlayerStats.health += PGS.heal_factor
	PlayerStats.health += PGS.heal_factor_charms
	if stats.health > stats.max_health :
		stats.health = stats.max_health
	if stats.mana > stats.max_mana:
		stats.mana = stats.max_mana
	if stats.stamina > stats.max_stamina :
		stats.stamina = stats.max_stamina
	if stats.stamina < 0 :
		stats.stamina = 0
	if stats.health <= stats.max_health / 4 and stats.health > 0 :
		$Visuals/VisualsAnim.play("LowHealth")
	else :
		$Visuals/VisualsAnim.play("Default")

# ELEMENTS DAMAGE -----------------------------------------------------------------------------------------------------------------
	# FIRE
	if PGS.fire == true :
		if PGS.FireProt == true:
			PGS.TEMP += 0.008
		else:
			PGS.TEMP += 0.03
	elif PGS.fire == false and PGS.TEMP > 0:
		PGS.TEMP -= 0.03
		if PGS.TEMP < 0:
			PGS.TEMP = 0

	if PGS.TEMP >= 10 :
		$HemwickSword/ElementDamage/ElementsAnim.play("Fire")
		$GUI/ElementDamage/Fire/FireAnim.play("Fire")
		if PGS.FireProt == true:
			PlayerStats.health -= 0.008
		else :
			PlayerStats.health -= 0.02
		$Sounds/Effects/Fire/FireSoundAnim.play("On")
	else:

		$HemwickSword/ElementDamage/ElementsAnim.play("FireOff")
		$GUI/ElementDamage/Fire/FireAnim.play("FireOff")
		$Sounds/Effects/Fire/FireSoundAnim.play("Off")




	if PGS.DREAD > PGS.MAX_DREAD / 1.5 :

		$Sounds/Effects/Dread/DreadSoundAnim.play("On")
		$GUI/ElementDamage/Dread/DreadAnim.play("Dread")
		$HemwickSword/ElementDamage/Dread/DreadAnim.play("Dread")

	else:
		$Sounds/Effects/Dread/DreadSoundAnim.play("Off")
		$GUI/ElementDamage/Dread/DreadAnim.play("DreadOff")





	match state :
		AIRDASH:
			_airdash(delta)
		PICKUP :
			_pickup(delta)
		ROLLFIGHT :
			_rollfight_state(delta)
		FIGHT :
			_fight(delta)
		ATTACKLIGHT:
			_attacklight(delta)
		ATTACKHEAVY :
			_attackheavy(delta)
		AIRRANGEDATTACK:
			_airrangedattack(delta)
		RANGEDATTACK:
			_rangedattack(delta)
		AIRATTACK :
			_airattack(delta)
		DASHATTACK:
			_dashattack(delta)
		AIRATTACKSLAM :
			_airattackslam(delta)
		FIGHTDIE :
			_fightdie(delta)
		BLOCK :
			_block(delta)
		BLOCKHIT :
			_blockhit(delta)
		COMBO :
			_combo(delta)
		COMBO2:
			_combo2(delta)
		DASH:
			_dash(delta)
		HANG:
			_hang(delta)
		BUFF:
			_buff(delta)
		HEAL:
			_heal(delta)
		REVIVE:
			_revive(delta)
		REBIRTH:
			_rebirth(delta)

func _pickup(_delta):
	motion.x = 0
	state_machine.travel("PickUp")

func _gravity():
	motion.y += GRAVITY
	if motion.y >= 350:
		motion.y = 350

	motion = move_and_slide(motion, Vector2.UP,true,4,0.785398,false)


	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)


func _fight(_delta) :

	PGS._dread_calc()
	_gravity()


#DIALOGUE ----------------------------------------------------------------
	if PGS.in_dialogue == false and PGS.alchemy == false:
		if $HemwickSword/PickUpRay.is_colliding() and Input.is_action_just_pressed("Interact"):
			state = PICKUP
#MOVEMENT ----------------------------------------------------------------
		if Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("Dash"):
			CharmsInv.update_charm_effects()

		if Input.is_action_pressed("LEFT") :
			if !CharmsInv.has_charm("Confusion"):
				motion.x = -PGS.MAXSPEED
				$HemwickSword.scale.x = -1
				state_machine.travel("FightMove")
			else:
				motion.x = PGS.MAXSPEED
				$HemwickSword.scale.x = 1
				state_machine.travel("FightMove")
			if PGS.submerged == true:
				$HemwickSword/Dust/DustRun.emitting = false
			else: $HemwickSword/Dust/DustRun.emitting = true

		elif Input.is_action_pressed("RIGHT") :
			if !CharmsInv.has_charm("Confusion"):
				motion.x = PGS.MAXSPEED
				$HemwickSword.scale.x = 1
				state_machine.travel("FightMove")
			else:
				motion.x = -PGS.MAXSPEED
				$HemwickSword.scale.x = -1
				state_machine.travel("FightMove")
			if PGS.submerged == true:
				$HemwickSword/Dust/DustRun.emitting = false
			else: $HemwickSword/Dust/DustRun.emitting = true
		else :
			$HemwickSword/Dust/DustRun.emitting = false
			state_machine.travel("Fight")
			motion.x = 0

#FAKE DASH ----------------------------------------------------------------
		_fake_dash()
#JUMPING ----------------------------------------------------------------

		if Input.is_action_just_pressed("jump") and PGS.has_jumped == false and stats.stamina > 5 and $FloorDetect.is_colliding():
			_fake_dash()
			motion.y = -PGS.JUMPFORCE
			PGS.has_jumped = true
			stats.stamina -= 5
			if CharmsInv.has_charm("Momentum"):
				CharmsInv.MOMENTUM_TIME -= 0.03

#HEAVY ATTACK --------------------------------------------------------------
		if Input.is_action_just_pressed("HeavyAttack") and stats.stamina > 30 and $FloorDetect.is_colliding():
			if CharmsInv.has_charm("InvertedWill"):
				state = DASH
			else:
				state = ATTACKHEAVY
				$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["heavyduration"]
				$SlideAttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["heavyslideduration"]
				$AttackTimer.start()
				$SlideAttackTimer.start()


		if Input.is_action_pressed("HeavyAttack") and stats.stamina > 10 and $FloorDetect.is_colliding() and PGS.Current_Equipped in PGS.RangedWeapons:
			if PGS.can_shoot == true:
				state = RANGEDATTACK
			else : state = FIGHT

#LIGHT ATTACK -------------------------------------------------------------
		if Input.is_action_just_pressed("LightAttack") and stats.stamina > 10 and $FloorDetect.is_colliding() :
			if CharmsInv.has_charm("InvertedWill"):
				state = DASH
			else:
				var anim = randi() % 3
				match anim:
					0:
						if last_attack != ATTACKLIGHT:
							state = ATTACKLIGHT
						else: state = COMBO
					1:
						if last_attack != COMBO:
							state = COMBO
						else: state = COMBO2
					2:
						if last_attack != COMBO2:
							state = COMBO2
						else: state = ATTACKLIGHT
				$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["duration"]
				$SlideAttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["slideduration"]
				$AttackTimer.start()
				$SlideAttackTimer.start()


#HANG ----------------------------------------------------------------
		if !is_on_floor():
			$HemwickSword/Dust/DustRun.emitting = false
			if $HangR.is_colliding() or $HangL.is_colliding():
				if !$FloorHang.is_colliding():
					$HemwickSword/Dust/DustRun.emitting = false
					$HangTimer.start()
					state = HANG

			if motion.y < 0 or motion.y == 0 or motion.y > 0:
				if !is_on_floor() and !$HangL.is_colliding() and !$HangR.is_colliding():
					if !$FloorDetect.is_colliding():
						state_machine.travel("FightJump")

#AIRDASH ----------------------------------------------------------------
					if Input.is_action_just_pressed("Dash") and PGS.airdashed == false and stats.stamina > 5 and $AnimationPlayer.current_animation != "Hurt":
						if !CharmsInv.has_charm("BindingFeather") and !CharmsInv.has_charm("EarthBound"):
							if CharmsInv.has_charm("InvertedWill"):
								state = AIRATTACK
								$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["duration"]
								$AttackTimer.start()
								stats.stamina -= 10
							else:
								state = AIRDASH
								stats.stamina -= 5
								PGS.airdashed = true
								var anim = randi() % 2
								match anim:
									0:
										$Sounds/AirDash.play()
										$Sounds/AirDash.pitch_scale = rand_range(0.8,1.2)
									1:
										$Sounds/AirDash2.play()
										$Sounds/AirDash2.pitch_scale = rand_range(0.8,1.2)

#AIR ATTACK ----------------------------------------------------------------
					if Input.is_action_just_pressed("LightAttack") and stats.stamina > 10 and air_attacked == false and $AnimationPlayer.current_animation != "Hurt":
						if CharmsInv.has_charm("InvertedWill"):
							state = AIRDASH
							stats.stamina -= 15
							PGS.airdashed = true
							var anim = randi() % 2
							match anim:
								0:
									$Sounds/AirDash.play()
									$Sounds/AirDash.pitch_scale = rand_range(0.8,1.2)
								1:
									$Sounds/AirDash2.play()
									$Sounds/AirDash2.pitch_scale = rand_range(0.8,1.2)
						else:

							state = AIRATTACK
							$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["duration"]
							$AttackTimer.start()
							stats.stamina -= 10

							if PGS.submerged == true:
								$HemwickSword/Dust/DustAirAttack.emitting = false
							else: $HemwickSword/Dust/DustAirAttack.emitting = true



#AIR RANGED ATTACK --------------------------------------------------------
					if Input.is_action_pressed("LightAttack") and stats.stamina >10 and air_attacked == false and PGS.Current_Equipped in PGS.RangedWeapons:
						state = AIRRANGEDATTACK

#SLAM ATTACK --------------------------------------------------------------
					if Input.is_action_pressed("DOwN") and Input.is_action_just_pressed("HeavyAttack") and PGS.Slam == true and stats.stamina > 15 :
						state = AIRATTACKSLAM
						stats.stamina -= 15

			if motion.y > 0 and !$FloorDetect.is_colliding():
				state_machine.travel("FightFall")


		else :
			PGS.has_jumped = false
			PGS.airdashed = false

#ROLL ----------------------------------------------------------------
		if is_on_floor() :
			if Input.is_action_just_pressed("Roll") and stats.stamina > 10:
				state = ROLLFIGHT
				stats.stamina -= 10
#DASH ----------------------------------------------------------------
			if Input.is_action_just_pressed("Dash") and stats.stamina > 10:
				if CharmsInv.has_charm("PhantomScar"):
					stats.health -= 1.5
				if PGS.submerged == true:
					$HemwickSword/Dust/DustSlide.emitting = false
				else: $HemwickSword/Dust/DustSlide.emitting = true

				if !CharmsInv.has_charm("EarthBound"):
					if CharmsInv.has_charm("InvertedWill"):
						var anim = randi() % 3
						match anim:
							0:
								if last_attack != ATTACKLIGHT:
									state = ATTACKLIGHT
								else: state = COMBO
							1:
								if last_attack != COMBO:
									state = COMBO
								else: state = COMBO2
							2:
								if last_attack != COMBO2:
									state = COMBO2
								else: state = ATTACKLIGHT
						$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["duration"]
						$SlideAttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["slideduration"]
						$AttackTimer.start()
						$SlideAttackTimer.start()
					else:
						state = DASH
						stats.stamina -= 10
						var anim = randi() % 2
						match anim:
							0:
								$Sounds/Dash.play()
							1:
								$Sounds/Dash2.play()

#OTHERS ----------------------------------------------------------------
			if Input.is_action_just_pressed("Buff"):
				state = BUFF
			if Input.is_action_just_pressed("Heal"):
				state = HEAL
	else:
		state_machine.travel("Fight")

func _roll_animation_finished():

	if state == ROLLFIGHT :
		state = FIGHT
	if state == DASH:
		$HemwickSword/DashHitbox/CollisionShape2D.disabled = true
		if $HangL.is_colliding() or $HangR.is_colliding():
			state = HANG
		else:
			state = FIGHT
	if state == DASHATTACK:
		state = FIGHT
	if state == REVIVE:
		state = FIGHT
	if state == PICKUP:
		state = FIGHT
	if state == AIRDASH:
		state = FIGHT
	if state == AIRATTACKSLAM:
		state = FIGHT

func _attack_combo():
	state = COMBO







func _attacklight(_delta) :
	_gravity()
	var sheet_name = PGS.weapons[PGS.Current_Equipped]["sheet"]
	$HemwickSword/HitBox/HitBoxAnim.play(sheet_name)
	$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"]

	if Input.is_action_pressed("LEFT") :
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /2
		else:
			motion.x = -ATTACKSPEED
	elif Input.is_action_pressed("RIGHT") :
		if PGS.submerged == true:
			motion.x = ATTACKSPEED /2
		else:
			motion.x = ATTACKSPEED
	else :
		motion.x = 0

	state_machine.travel("AttackL")
	last_attack = ATTACKLIGHT

func _attackheavy(_delta) :
	_gravity()

	var heavy_sheet_name = PGS.weapons[PGS.Current_Equipped]["sheetheavy"]
	$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"] * 2
	$HemwickSword/HitBox/HitBoxAnim.play(heavy_sheet_name)

	if Input.is_action_pressed("LEFT") :
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /2
		else:
			motion.x = -ATTACKSPEED
	elif Input.is_action_pressed("RIGHT") :
		if PGS.submerged == true:
			motion.x = ATTACKSPEED /2
		else:
			motion.x = ATTACKSPEED
	else :
		motion.x = 0

	state_machine.travel("AttackH")


	if PGS.Current_Equipped == "fireball":
		$HemwickSword/HitBoxUnarmed.damage = PGS.default_STRENGTH * PGS.fireball_damage + 2
		state_machine.travel("Magic")
		if !get_global_mouse_position().x > global_position.x and $HemwickSword.scale.x == -1 or !get_global_mouse_position().x < global_position.x and $HemwickSword.scale.x == 1:
			if $HemwickSword.scale.x == 1:
				$Crosshair.rotation_degrees = clamp($Crosshair.rotation_degrees, -90, 90)
			elif $HemwickSword.scale.x == -1:
				$Crosshair.rotation_degrees = clamp($Crosshair.rotation_degrees, -270, -90)

func _combo(_delta):
	last_attack = COMBO
	state_machine.travel("AttackL2")
	_gravity()

	var sheet_name = PGS.weapons[PGS.Current_Equipped]["sheet"]
	$HemwickSword/HitBox/HitBoxAnim.play(sheet_name)
	$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"]

	if Input.is_action_pressed("LEFT") :
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /2
		else:
			motion.x = -ATTACKSPEED
	elif Input.is_action_pressed("RIGHT") :
		if PGS.submerged == true:
			motion.x = ATTACKSPEED /2
		else:
			motion.x = ATTACKSPEED
	else :
		motion.x = 0




func _combo2(_delta):
	last_attack = COMBO2
	state_machine.travel("AttackL3")
	_gravity()

	var sheet_name = PGS.weapons[PGS.Current_Equipped]["sheet"]
	$HemwickSword/HitBox/HitBoxAnim.play(sheet_name)
	$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"]

	if Input.is_action_pressed("LEFT") :
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /2
		else:
			motion.x = -ATTACKSPEED
	elif Input.is_action_pressed("RIGHT") :
		if PGS.submerged == true:
			motion.x = ATTACKSPEED /2
		else:
			motion.x = ATTACKSPEED
	else :
		motion.x = 0



func _combotimeradd():

	if state == ATTACKHEAVY:
		stats.stamina -= PGS.weapons[PGS.Current_Equipped]["staminadrain"]*3
	else:
		stats.stamina -= PGS.weapons[PGS.Current_Equipped]["staminadrain"]

func _combo_finish():
	state = FIGHT

func _rollfight_state(_delta) :
	_gravity()

	if $HemwickSword.scale.x == 1 :
		if PGS.submerged == true:
			motion = roll_vectorR * ROLLSPEED /3.6
		else:
			motion = roll_vectorR * ROLLSPEED /1.2
	elif $HemwickSword.scale.x == -1:
		if PGS.submerged == true:
			motion = roll_vectorL * ROLLSPEED /3.6
		else:
			motion = roll_vectorL * ROLLSPEED /1.2
	state_machine.travel("RollFight")

func _dash(_delta):
	if CharmsInv.has_charm("PhantomScar"):
		$HemwickSword/DashHitbox.damage = PlayerStats.health / 2
		$HemwickSword/DashHitbox/CollisionShape2D.disabled = false
	else:
		$HemwickSword/DashHitbox/CollisionShape2D.disabled = true
	_gravity()
	if $AnimationPlayer.current_animation == "Hurt":
		$AnimationPlayer.stop()

	state_machine.travel("Dash")

	if $HemwickSword.scale.x == 1:
		if PGS.submerged == true:
			motion = roll_vectorR * ROLLSPEED /4.5
		else: motion = roll_vectorR * ROLLSPEED*1.1
	elif $HemwickSword.scale.x == -1:
		if PGS.submerged == true:
			motion = roll_vectorL * ROLLSPEED /4.5
		else:motion = roll_vectorL * ROLLSPEED *1.1


	if Input.is_action_pressed("LightAttack") or Input.is_action_just_pressed("LightAttack"):
		if PGS.Current_Equipped in PGS.DaggersWeapons and PlayerSkills.InscrutableRush == true:
			state = DASHATTACK

func _airdash(_delta):
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)
	state_machine.travel("DashAir")


	if $HemwickSword.scale.x == 1:

		if PGS.submerged == true:
			motion.x = ATTACKSPEED /3

		else:
			motion.x = ATTACKSPEED

	if $HemwickSword.scale.x == -1:
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /3
		else:
			motion.x = -ATTACKSPEED

	if Input.is_action_pressed("DOwN") and Input.is_action_just_pressed("HeavyAttack") and PGS.Slam == true and stats.stamina > 20 :
						state = AIRATTACKSLAM
						stats.stamina -= 20

func _hang(_delta):
	PGS.airdashed = false
	motion.y += 4
	if motion.y >= 350:
		motion.y = 350


	state_machine.travel("Hang")
	motion = move_and_slide(motion, Vector2.UP,false,4,0.785398,false)


	if $HangL.is_colliding():
		$HemwickSword.scale.x = 1
		motion.y = 10
	elif $HangR.is_colliding():
		$HemwickSword.scale.x = -1
		motion.y = 10


	if $WallDetect.is_colliding():
		motion.y =  $WallDetect.get_collider().PGS.MAXSPEED

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)


	if can_jump_hang == true:
		if Input.is_action_just_pressed("jump") and stats.stamina > 10:
			$HangTimer.start()
			stats.stamina -= 10
			if $HangL.is_colliding():
				$HangL.enabled = false
				$HangR.enabled = true
				motion.y = -PGS.JUMPFORCE - 80
			if $HangR.is_colliding():
				$HangR.enabled = false
				$HangL.enabled = true
				motion.y = -PGS.JUMPFORCE - 80
			state = FIGHT
		elif Input.is_action_just_pressed("RIGHT") or Input.is_action_just_pressed("LEFT"):
			state = FIGHT
			if $HemwickSword.scale.x == 1:
				$HangL.enabled = false
				$HangR.enabled = true
			if $HemwickSword.scale.x == -1:
				$HangL.enabled = true
				$HangR.enabled = false

	if $FloorDetect.is_colliding():
		state = FIGHT
		$HangL.enabled = false
		$HangR.enabled = false
	elif !$HangL.is_colliding() and !$HangR.is_colliding():
		state = FIGHT

	if Input.is_action_just_pressed("Dash") and stats.stamina > 10 and PGS.Dash == true:
		if PGS.submerged == true:
			$HemwickSword/Dust/DustSlide.emitting = false
		else: $HemwickSword/Dust/DustSlide.emitting = true
		state = DASH
		stats.stamina -= 10
		var anim = randi() % 2
		match anim:
			0:
				$Sounds/Dash.play()
			1:
				$Sounds/Dash2.play()





func _on_HurtBox_area_entered(area):
	if area.Hostile == true and !state == ROLLFIGHT and !state == BLOCK and !state == BLOCKHIT and !state == ATTACKHEAVY and !state == ATTACKLIGHT and !state == REVIVE and $AnimationPlayer.current_animation != "Hurt":
		if area.global_position.x < $HemwickSword/HurtBox.global_position.x:
			knockback = Vector2.RIGHT * 150
			motion.y = -400
		elif area.global_position.x > $HemwickSword/HurtBox.global_position.x:
			knockback = Vector2.LEFT * 150
			motion.y = -400
	elif area.Hostile == true and state == BLOCK or state == BLOCKHIT:
		if area.global_position.x < $HemwickSword/HurtBox.global_position.x:
			if area.damage > 10:
				knockback = Vector2.RIGHT * 15 * area.damage/2
			else:
				knockback = Vector2.RIGHT * 15 * area.damage
			if $HemwickSword.scale.x == 1:
				if area.damage > 10:
					knockback = Vector2.RIGHT * 30 * area.damage/2
				else:
					knockback = Vector2.RIGHT * 30 * area.damage
				motion.y = -400
		elif area.global_position.x > $HemwickSword/HurtBox.global_position.x:
			knockback = Vector2.LEFT * 15 * area.damage
			if $HemwickSword.scale.x == -1:
				knockback = Vector2.LEFT * 30 * area.damage
				motion.y = -400


	if !state == REVIVE:
		$Sounds/Hurt.play()
		$AnimationPlayer.play("Hurt")




		if CharmsInv.has_charm("Rage"):
			CharmsInv.RAGE_STRENGTH += 1

		if CharmsInv.has_charm("BloodForged"):
			if PGS.coins > area.damage:
				PGS.coins -= area.damage * 2
				$GoldDrop.base_gold_drop= rand_range(1,3)
				$GoldDrop.drop_gold()
			else:
				PlayerStats.health -= area.damage * 2
		else:
			if CharmsInv.has_charm("CursedHeart"):
				stats.health -= area.damage * 4
			if CharmsInv.has_charm("GlacialEmbrace"):
				stats.health -= area.damage - area.damage * 1.4
			if CharmsInv.has_charm("ObsidianCharm"):
				stats.health -= area.damage / 2
			if CharmsInv.has_charm("GildedScar"):
				stats.health -= area.damage * 1.3
				$GoldDrop.base_gold_drop= rand_range(1,12)
				$GoldDrop.drop_gold()
			if CharmsInv.has_charm("Mirror"):
				stats.health -= area.damage * 2
			else:
				PlayerStats.health -= area.damage




		frameFreeze(0.3, 0.2)
		PGS.camera.shake(400,0.2,900)
		$Visuals/VisualsAnim.play("Blood")
		$HemwickSword/HurtBox.hurteffect_show = true

		if PlayerSkills.Riposte == true and state != DASHATTACK:
			if randf() < 0.2:
				state = DASHATTACK
				if area.global_position.x < $HemwickSword/HurtBox.global_position.x:
					$HemwickSword.scale.x = -1
				elif area.global_position.x > $HemwickSword/HurtBox.global_position.x:
					$HemwickSword.scale.x = 1
				PlayerStats.initial_base_damage += 1
				$DashAttackTimer.start()



	if PGS.Bandage == true:
		if randf() < 0.2:
			$RegenLifeTimer.start()
			bandage_regen = true





func _dashattack(_delta):
	air_attacked = true
	_gravity()

	if $HemwickSword.scale.x == 1:
		if PGS.submerged == true:
			motion.x = ATTACKSPEED /4
		else:
			motion.x = ATTACKSPEED + 150
	if $HemwickSword.scale.x == -1:
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /4
		else:
			motion.x = -ATTACKSPEED - 150

	state_machine.travel("DashAttack")

func _airattackslam(_delta):

	motion.y = GRAVITY
	motion.x = 0
	motion = move_and_slide(motion, Vector2.UP,false,4,0.785398,false)

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)

	if !$FloorDetect.is_colliding():
		$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"]
		state_machine.travel("AttackSlam")
	else :
		$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"] + add_slam_damage
		state_machine.travel("AttackSlamLand")




func _airattack(_delta) :
	air_attacked = true
	motion.y = GRAVITY
	motion = move_and_slide(motion, Vector2.UP)
	state_machine.travel("AttackAir")

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)

	if $HemwickSword.scale.x == 1:
		if PGS.submerged == true:
			motion.x = ATTACKSPEED /2
		else:
			motion.x = ATTACKSPEED
	if $HemwickSword.scale.x == -1:
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED /2
		else:
			motion.x = -ATTACKSPEED

	$HemwickSword/HitBox.damage = PGS.STRENGTH * PGS.weapons[PGS.Current_Equipped]["damage"]


func _airrangedattack(_delta):
	air_attacked = true
	motion.y = 5
	motion = move_and_slide(motion, Vector2.UP,false,4,0.785398,false)


	if $HemwickSword.scale.x == 1:
		if PGS.submerged == true:
			motion.x = ATTACKSPEED / 3
		else:
			motion.x = ATTACKSPEED + 140
	if $HemwickSword.scale.x == -1:
		if PGS.submerged == true:
			motion.x = -ATTACKSPEED / 3
		else:
			motion.x = -ATTACKSPEED - 140

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("RigidBodies"):
			collision.collider.apply_central_impulse(-collision.normal * push_force)



	state_machine.travel("BowAttackAir")

	if PGS.can_shoot and !PGS.slot1 == "none":
		stats.stamina -= 0.25
		$HemwickSword/AdditionalAssets/Bow/BowAnim.play("DrawAir")
	else:
		state = FIGHT

	if $HemwickSword.scale.x == 1:
		$Crosshair.rotation_degrees = clamp($Crosshair.rotation_degrees, -60, 60)

		$HemwickSword/Accessories/Hat.rotation_degrees = $Crosshair.rotation_degrees / 4
		$HemwickSword/AdditionalAssets/Bow/RightHand.rotation_degrees = $Crosshair.rotation_degrees
		$HemwickSword/AdditionalAssets/Bow/RightHand.scale.x =1


	else:
		$Crosshair.rotation_degrees = clamp($Crosshair.rotation_degrees, 120, 240)

		$HemwickSword/Accessories/Hat.rotation_degrees = -$Crosshair.rotation_degrees / 4 +40
		$HemwickSword/AdditionalAssets/Bow/RightHand.rotation_degrees = -$Crosshair.rotation_degrees
		$HemwickSword/AdditionalAssets/Bow/RightHand.scale.x =-1





func _rangedattack(_delta):
	_gravity()


	motion.x = 0
	state_machine.travel("Bow")
	state_machine_bow.travel("BowAttackH")


	if PGS.slot1number >= 0 :
		if Input.is_action_pressed("LightAttack") and PGS.can_shoot == true:
			stats.stamina -= 0.25
			if stats.stamina <= 10:
				$HemwickSword/AdditionalAssets/Bow/BowAnim.play("Shoot")
				PGS.can_shoot = false
			if PGS.can_shoot == true and $HemwickSword/AdditionalAssets/Bow/BowAnim.current_animation != "Shoot":
				$HemwickSword/AdditionalAssets/Bow/BowAnim.play("Draw")


		if Input.is_action_just_released("LightAttack") and PGS.can_shoot == true:


			$HemwickSword/AdditionalAssets/Bow/BowAnim.play("Shoot")
			PGS.can_shoot = false
	else:
		state = FIGHT

	if $HemwickSword.scale.x == 1:
		$Crosshair.rotation_degrees = clamp($Crosshair.rotation_degrees, -60, 60)

		$HemwickSword/Accessories/Hat.rotation_degrees = $Crosshair.rotation_degrees / 4
		$HemwickSword/AdditionalAssets/Bow/RightHand.rotation_degrees = $Crosshair.rotation_degrees
		$HemwickSword/AdditionalAssets/Bow/RightHand.scale.x =1


	else:
		$Crosshair.rotation_degrees = clamp($Crosshair.rotation_degrees, 120, 240)

		$HemwickSword/Accessories/Hat.rotation_degrees = -$Crosshair.rotation_degrees / 4 +40
		$HemwickSword/AdditionalAssets/Bow/RightHand.rotation_degrees = -$Crosshair.rotation_degrees
		$HemwickSword/AdditionalAssets/Bow/RightHand.scale.x =-1




	if Input.is_action_just_released("HeavyAttack"):
		$HemwickSword/AdditionalAssets/Bow._speedreset()
		state = FIGHT
		state_machine_bow.travel("Fight")
		state_machine.travel("Fight")







func _fightdie(_delta) :
	_gravity()

	state_machine.travel("FightDie")
	if is_on_floor() :
		set_physics_process(false)
func _block(_delta) :
	_gravity()




	if Input.is_action_pressed("LEFT") :
		motion.x = -PGS.MAXSPEED
		$HemwickSword.scale.x = -1
		state_machine.travel("BlockMove")

	elif Input.is_action_pressed("RIGHT") :
		motion.x = PGS.MAXSPEED
		$HemwickSword.scale.x = 1
		state_machine.travel("BlockMove")
	else :
		state_machine.travel("Block")
		motion.x = 0

	if Input.is_action_just_released("Block") :
		state = FIGHT

	if Input.is_action_just_pressed("LightAttack") :
		if PGS.sword == true :
			stats.stamina -= 15
		elif PGS.spear == true :
			stats.stamina -= 17
		elif PGS.Current_Equipped == "dagger" :
			stats.stamina -= 8
		state = ATTACKLIGHT
	if Input.is_action_just_pressed("HeavyAttack") :
		if PGS.sword == true :
			stats.stamina -= 30
		elif PGS.spear == true :
			stats.stamina -= 32
		elif PGS.Current_Equipped == "dagger" :
			stats.stamina -= 20
		state = ATTACKHEAVY
	if stats.health <= 0 :
		state = FIGHTDIE
func _blockhit(_delta) :
	_gravity()

	state_machine.travel("BlockHit")
	if stats.health <= 0 :
		state = FIGHTDIE

func _blockhit_finished() :
	state = FIGHT



func frameFreeze(timeScale, duration):
	Engine.time_scale = timeScale
	yield(get_tree().create_timer(duration * timeScale), "timeout")
	Engine.time_scale = PGS.default_TIMESCALE
	CharmsInv.update_charm_effects()


func _on_HitBox_area_entered(area):

	#print(area.stats.health)


	if CharmsInv.has_charm("FinalToll"):
		CharmsInv.FINALTOLL_STRENGTH += 0.05
		CharmsInv.FINALTOLL_NUMBER += 1
	if CharmsInv.has_charm("Leech"):
		stats.health += 0.3
	if CharmsInv.has_charm("Reversal"):
		stats.health -= 0.8
	if CharmsInv.has_charm("WhisperBrand"):
		stats.health += 2
	if CharmsInv.has_charm("Momentum"):
		CharmsInv.MOMENTUM_TIME += 0.01




		#frameFreeze(0.1, 0.3)
		PGS.camera.shake(200,0.3,100)
		if PGS.LifeSteal == true:
			if randf() < 0.05:
				life_steal_on_hit = true
				$LifeStealTimer.start()
	else:
		PGS.harvested = true




	if PGS.Current_Equipped in PGS.DaggersWeapons:
		var anim = randi() % 10
		match anim:
			0:
				$HemwickSword/HitSounds/Daggers/HitDagger.play()
			1:
				$HemwickSword/HitSounds/Daggers/HitDagger2.play()
			2:
				$HemwickSword/HitSounds/Daggers/HitDagger3.play()
			3:
				$HemwickSword/HitSounds/Daggers/HitDagger4.play()
			4:
				$HemwickSword/HitSounds/Daggers/HitDagger5.play()
			5:
				$HemwickSword/HitSounds/Daggers/HitDagger6.play()
			6:
				$HemwickSword/HitSounds/Daggers/HitDagger7.play()
			7:
				$HemwickSword/HitSounds/Daggers/HitDagger8.play()
			8:
				$HemwickSword/HitSounds/Daggers/HitDagger9.play()
			9:
				$HemwickSword/HitSounds/Daggers/HitDagger10.play()

	if PGS.Current_Equipped in PGS.SwordWeapons:
		var anim = randi() % 5
		match anim:
			0:
				$HemwickSword/HitSounds/Shortswords/HitShortsword.play()
			1:
				$HemwickSword/HitSounds/Shortswords/HitShortsword2.play()
			2:
				$HemwickSword/HitSounds/Shortswords/HitShortsword3.play()
			3:
				$HemwickSword/HitSounds/Shortswords/HitShortsword4.play()
			4:
				$HemwickSword/HitSounds/Shortswords/HitShortsword5.play()

	if PGS.Current_Equipped in PGS.ShortSwordsWeapons:
		var anim = randi() % 11
		match anim:
			0:
				$HemwickSword/HitSounds/Swords/HitSword.play()
			1:
				$HemwickSword/HitSounds/Swords/HitSword2.play()
			2:
				$HemwickSword/HitSounds/Swords/HitSword3.play()
			3:
				$HemwickSword/HitSounds/Swords/HitSword4.play()
			4:
				$HemwickSword/HitSounds/Swords/HitSword5.play()
			5:
				$HemwickSword/HitSounds/Swords/HitSword6.play()
			6:
				$HemwickSword/HitSounds/Swords/HitSword7.play()
			7:
				$HemwickSword/HitSounds/Swords/HitSword8.play()
			8:
				$HemwickSword/HitSounds/Swords/HitSword9.play()
			9:
				$HemwickSword/HitSounds/Swords/HitSword10.play()
			10:
				$HemwickSword/HitSounds/Swords/HitSword11.play()

	if PGS.Current_Equipped in PGS.SpecialWeapons:

		var anim = randi() % 5
		match anim:
			0:
				$HemwickSword/HitSounds/Blunt/HitBlunt.play()
			1:
				$HemwickSword/HitSounds/Blunt/HitBlunt2.play()
			2:
				$HemwickSword/HitSounds/Blunt/HitBlunt3.play()
			3:
				$HemwickSword/HitSounds/Blunt/HitBlunt4.play()
			4:
				$HemwickSword/HitSounds/Blunt/HitBlunt5.play()
			5:
				$HemwickSword/HitSounds/Blunt/HitBlunt6.play()
			6:
				$HemwickSword/HitSounds/Blunt/HitBlunt7.play()
			7:
				$HemwickSword/HitSounds/Blunt/HitBlunt8.play()

func _buff(_delta):
	_gravity()

	state_machine.travel("Buff")

func _heal(_delta):
	_gravity()

	state_machine.travel("Heal")

func _revive(_delta):
	_gravity()

	state_machine.travel("Revive")
	unleash_revive = true
	stats.health = stats.max_health/3

func _rebirth(_delta):
	_gravity()

	reborn = true
	stats.health = stats.max_health / 2


func _sounds() :
	_type_of_floor()



func _type_of_floor() :
	if $TypeOfFloorDetect/Concrete.is_colliding() :
		PGS.on_concrete = true
	else :
		PGS.on_concrete = false

	if $TypeOfFloorDetect/Grass.is_colliding() :
		PGS.on_grass = true
	else :
		PGS.on_grass = false

	if $TypeOfFloorDetect/Planks.is_colliding() :
		PGS.on_planks = true
	else :
		PGS.on_planks = false

	if $TypeOfFloorDetect/Metal.is_colliding() :
		PGS.on_metal = true
	else :
		PGS.on_metal = false

	if PGS.on_concrete == true :
		$Sounds/TypesOfFloorSounds/Concrete.max_distance = 2000
		$Sounds/TypesOfFloorSounds/Planks.max_distance = 1
		$Sounds/TypesOfFloorSounds/Grass.max_distance = 1
		$Sounds/TypesOfFloorSounds/Metal.max_distance = 1

	if PGS.on_grass == true :
		$Sounds/TypesOfFloorSounds/Concrete.max_distance = 1
		$Sounds/TypesOfFloorSounds/Planks.max_distance = 1
		$Sounds/TypesOfFloorSounds/Grass.max_distance = 2000
		$Sounds/TypesOfFloorSounds/Metal.max_distance = 1

	if PGS.on_planks == true :
		$Sounds/TypesOfFloorSounds/Concrete.max_distance = 1
		$Sounds/TypesOfFloorSounds/Planks.max_distance = 2000
		$Sounds/TypesOfFloorSounds/Grass.max_distance = 1
		$Sounds/TypesOfFloorSounds/Metal.max_distance = 1

	if PGS.on_metal == true :
		$Sounds/TypesOfFloorSounds/Concrete.max_distance = 1
		$Sounds/TypesOfFloorSounds/Planks.max_distance = 1
		$Sounds/TypesOfFloorSounds/Grass.max_distance = 1
		$Sounds/TypesOfFloorSounds/Metal.max_distance = 2000





func _on_EnterTimer_timeout():
	$Sounds/Effects/Dread/DreadOff.volume_db = 0
	$Sounds/Effects/Fire/FireOff.volume_db = 0

func _on_RegenLifeTimer_timeout():
	bandage_regen = false
	$HemwickSword/CharacterEffects/BandageHeal/BandageHealAnim.play("Stop")

func _on_LifeStealTimer_timeout():
	life_steal_on_hit = false



func _on_DashAttackTimer_timeout():
	PlayerStats.initial_base_damage -= 1

func _throwmagic():
	_gravity()

	if PGS.Current_Equipped == "fireball":
		var Fireball = preload("res://Effects/Spells/FireballPhysics.tscn")
		var fireball = Fireball.instance()
		get_tree().current_scene.add_child(fireball)
		fireball.transform = $Crosshair/Position2D.global_transform
		if get_global_mouse_position().x > global_position.x and $HemwickSword.scale.x == -1:
			$HemwickSword.scale.x = 1
		elif get_global_mouse_position().x < global_position.x and $HemwickSword.scale.x == 1:
			$HemwickSword.scale.x = -1

func _landdust():
	if state == FIGHT:
		if PGS.submerged == true:
			$HemwickSword/Dust/DustLand.emitting = false
		else:
			$HemwickSword/Dust/DustLand.emitting = true
	elif state == ROLLFIGHT:
		if PGS.submerged == true:
			$HemwickSword/Dust/DustRoll.emitting = false
		else:
			$HemwickSword/Dust/DustRoll.emitting = true

func _landdust2():
	if state == ROLLFIGHT:
		if PGS.submerged == true:
			$HemwickSword/Dust/DustLandRoll.emitting = false
		else: $HemwickSword/Dust/DustLandRoll.emitting = true

func _hangland():
	$HemwickSword/Dust/DustHangLand.emitting = true
	if $HemwickSword.scale.x == 1:
		$HemwickSword/Dust/DustHangLand/DustHangAnim.play("RIGHT")
	else:
		$HemwickSword/Dust/DustHangLand/DustHangAnim.play("LEFT")





func _on_HangTimer_timeout():
	if is_on_wall():
		$HangR.enabled = false
		$HangL.enabled = false

func _can_shoot():
	if PGS.slot1number > 0:
		PGS.can_shoot = true
	else :
		PGS.can_shoot = false
		state = FIGHT

func _shoot_arrow():

	if !PGS.slot1 == "none":
		PGS.slot1number -= 1



	if PGS.Current_Equipped in PGS.RangedWeapons:
		if PGS.slot1number >= 0:
			var Arrow = preload("res://Entities/Hemwick/Bows/Arrows/SimpleArrow.tscn")
			var arrow = Arrow.instance()
			get_tree().current_scene.add_child(arrow)
			arrow.transform = $Crosshair/Position2D.global_transform
			if $HemwickSword/AdditionalAssets/Bow.speedone == true:
				arrow.get_node("HitBox").damage = PGS.arrow_damage + 1
				arrow.speed = 100
				arrow.gravity_scale = 3
			if $HemwickSword/AdditionalAssets/Bow.speedtwo == true:
				arrow.get_node("HitBox").damage = PGS.arrow_damage + 2
				arrow.speed = 200
				arrow.gravity_scale = 2
			if $HemwickSword/AdditionalAssets/Bow.speedthree == true:
				arrow.get_node("HitBox").damage = PGS.arrow_damage + 3
				arrow.speed = 300
				arrow.gravity_scale = 1
			if $HemwickSword/AdditionalAssets/Bow.speedfour == true:
				arrow.get_node("HitBox").damage = PGS.arrow_damage + 5
				arrow.speed = 400
				arrow.gravity_scale = 0.75
			if $HemwickSword/AdditionalAssets/Bow.speedfive == true:
				arrow.get_node("HitBox").damage = PGS.arrow_damage + 8
				arrow.speed = 500
				arrow.gravity_scale = 0.5

func _shootarrowsounds():
	var anim = randi() % 5
	match anim:
		0: $HemwickSword/HitSounds/Bows/BowShoot1.play()
		1: $HemwickSword/HitSounds/Bows/BowShoot2.play()
		2: $HemwickSword/HitSounds/Bows/BowShoot3.play()
		3: $HemwickSword/HitSounds/Bows/BowShoot4.play()
		4: $HemwickSword/HitSounds/Bows/BowShoot5.play()



func _on_AttackTimer_timeout():
	state = FIGHT





func _on_SlideAttackTimer_timeout():
	ATTACKSPEED = 500





func _fake_dash():
	if CharmsInv.has_charm("Puppet"):
			if randi() % 1000 < 3: # Roughly 0.3% chance per frame (can tune it)
				# Simulate dash key being pressed
				if motion.y != 0:
					if PGS.airdashed == false and $AnimationPlayer.current_animation != "Hurt":
						if !CharmsInv.has_charm("BindingFeather") and !CharmsInv.has_charm("EarthBound"):
							if CharmsInv.has_charm("InvertedWill"):
								state = AIRATTACK
								$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["duration"]
								$AttackTimer.start()
								stats.stamina -= 10
							else:
								state = AIRDASH
								stats.stamina -= 15
								PGS.airdashed = true
								var anim = randi() % 2
								match anim:
									0:
										$Sounds/AirDash.play()
										$Sounds/AirDash.pitch_scale = rand_range(0.8,1.2)
									1:
										$Sounds/AirDash2.play()
										$Sounds/AirDash2.pitch_scale = rand_range(0.8,1.2)
				elif motion.y == 0 :
					if CharmsInv.has_charm("PhantomScar"):
						stats.health -= 1.5
					if PGS.submerged == true:
						$HemwickSword/Dust/DustSlide.emitting = false
					else: $HemwickSword/Dust/DustSlide.emitting = true

					if !CharmsInv.has_charm("EarthBound"):
						if CharmsInv.has_charm("InvertedWill"):
							var anim = randi() % 3
							match anim:
								0:
									if last_attack != ATTACKLIGHT:
										state = ATTACKLIGHT
									else: state = COMBO
								1:
									if last_attack != COMBO:
										state = COMBO
									else: state = COMBO2
								2:
									if last_attack != COMBO2:
										state = COMBO2
									else: state = ATTACKLIGHT
							$AttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["duration"]
							$SlideAttackTimer.wait_time = PGS.weapons[PGS.Current_Equipped]["slideduration"]
							$AttackTimer.start()
							$SlideAttackTimer.start()
						else:
							state = DASH
							stats.stamina -= 10
							var anim = randi() % 2
							match anim:
								0:
									$Sounds/Dash.play()
								1:
									$Sounds/Dash2.play()
