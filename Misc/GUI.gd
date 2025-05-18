extends CanvasLayer


export var livingendX = 0
export var livingendY = 0
export var healthendX = 0
export var healthendY = 0
export var staminaendX = 0
export var staminaendY = 0
export var manaendX = 0
export var manaendY = 0
export var GUIOn = false

onready var WeaponSecondary = $FrameSecondary/Weapons/Weapon
onready var WeaponPrimary = $FramePrimary/Weapons/Weapon

onready var bow = preload("res://Misc/UI elements/WeaponIcons/Bow.png")
onready var dagger = preload("res://Misc/UI elements/WeaponIcons/Dagger.png")
onready var fireball = preload("res://Misc/UI elements/WeaponIcons/Fireball.png")
onready var shovel = preload("res://Misc/UI elements/WeaponIcons/Hoe.png")
onready var celeste = preload("res://Misc/UI elements/WeaponIcons/HemwickSword.png")
onready var hemwicksword = preload("res://Misc/UI elements/WeaponIcons/HemwickSword.png")


var current_displayed_charms = ["", "", "", "",""]  # Match your 5 slots



# Called when the node enters the scene tree for the first time.
func _ready():
	$FramePrimary/EquipAnimPrimary.play("Weapon")
	$FrameSecondary/EquipAnimSecondary.play("Weapon")
	$GUIAnim.play("ChangeToPrimary")
	CharmsInv.clear_charms()
	update_charm_slots()



func update_charm_slots():
	var slots = [
		$VBoxContainer/Charm1,
		$VBoxContainer/Charm2,
		$VBoxContainer/Charm3,
		$VBoxContainer/Charm4,
		$VBoxContainer/Charm5
	]

	for i in range(slots.size()):
		var slot = slots[i]
		var anim_player = slot.get_node("CharmType")
		var appear_player = slot.get_node("AppearAnim")

		# Hide any slots beyond MAX_CHARMS immediately
		if i >= CharmsInv.MAX_CHARMS:
			slot.hide()
			current_displayed_charms[i] = ""
			continue
		else:
			slot.show()

		# Display charm if exists in current slot
		if i < CharmsInv.Current_Charms.size():
			var charm_name = CharmsInv.Current_Charms[i]

			if current_displayed_charms[i] != charm_name:
				# Only play disappear if there was something already shown
				if current_displayed_charms[i] != "" and appear_player.has_animation("Disappear"):
					appear_player.stop()
					appear_player.play("Disappear")
					yield(appear_player, "animation_finished")

				# Now update the charm visuals
				current_displayed_charms[i] = charm_name
				if anim_player.has_animation(charm_name):
					anim_player.stop()
					anim_player.play(charm_name)
				else:
					anim_player.stop()

				# Play appear animation for the new charm
				if appear_player.has_animation("Appear"):
					appear_player.stop()
					appear_player.play("Appear")

func _physics_process(delta):
	if CharmsInv.has_charm("FinalToll"):
		$CharmsAdditions/FinalToll.visible = true
		$CharmsAdditions/FinalToll/HBoxContainer/Needed/Label.text = "%d" % int(PlayerStats.health - CharmsInv.FINALTOLL_NUMBER)
	else:
		$CharmsAdditions/FinalToll.visible = false

	if PGS.inventory == true or PGS.alchemy == true:
		$BarsAnim.play("On")
	else: $BarsAnim.play("Off")

	$DebugStats/TempNumber.text = "%s" % [PGS.TEMP]
	$DebugStats/DreadNumber.text = "%s" %  [PGS.DREAD]



	#if PGS.is_on_floor == true:
		#if Input.is_action_just_pressed("ChangeWeapon") and PGS.PrimarySelect == true:
			#$GUIAnim.play("ChangeToSecondary")
			#PGS.Current_Equipped = PGS.Secondary
			#PGS.PrimarySelect = false

		#elif Input.is_action_just_pressed("ChangeWeapon") and PGS.PrimarySelect == false:
			#$GUIAnim.play("ChangeToPrimary")
			#PGS.Current_Equipped = PGS.Primary
			#PGS.PrimarySelect = true

	_livingbarend(delta)
	_healthbarend(delta)
	_staminabarend(delta)
	_manabarend(delta)
	_uivisibility(delta)


func _livingbarend(_delta) :
	$LivingUI/LivingEnd.position.x = livingendX
	$LivingUI/LivingEnd.position.y = livingendY
	livingendY = 46

	if PlayerStats.max_living == 30 :
		livingendX = 337
	elif PlayerStats.max_living == 50 :
		livingendX = 554
	elif PlayerStats.max_living == 70 :
		livingendX = 771
	elif PlayerStats.max_living == 90 :
		livingendX = 988
	elif PlayerStats.max_living == 110 :
		livingendX = 1205
	elif PlayerStats.max_living == 130 :
		livingendX = 1422
	elif PlayerStats.max_living == 150 :
		livingendX = 1639

func _healthbarend(_delta) :
	$HealthUI/HealthEnd.position.x = healthendX
	$HealthUI/HealthEnd.position.y = healthendY
	healthendY = 49
	healthendX = $HealthUI/Healthcontour.margin_right



func _staminabarend(_delta) :
	$StaminaUI/StaminaEnd.position.x = staminaendX
	$StaminaUI/StaminaEnd.position.y = staminaendY
	staminaendY = 49
	staminaendX = $StaminaUI/Staminacontour.margin_right

func _manabarend(_delta) :
	$ManaUI/ManaEnd.position.x = manaendX
	$ManaUI/ManaEnd.position.y = manaendY
	manaendY = 49
	manaendX = $ManaUI/Manacontour.margin_right

func _uivisibility(_delta) :
	if PGS.pickup_weaponprimary == true:
		$FramePrimary/EquipAnimPrimary.stop(true)
		$FramePrimary/EquipAnimPrimary.play("Weapon")
	if PGS.pickup_weaponsecondary == true:
		$FrameSecondary/EquipAnimSecondary.stop(true)
		$FrameSecondary/EquipAnimSecondary.play("Weapon")


	if PGS.Primary == "dagger":
		WeaponPrimary.texture = dagger
	elif PGS.Secondary == "dagger":
		WeaponSecondary.texture = dagger

	if PGS.Primary == "celeste":
		WeaponPrimary.texture = celeste
	elif PGS.Secondary == "celeste":
		WeaponSecondary.texture = celeste

	if PGS.Primary == "hemwicksword":
		WeaponPrimary.texture = hemwicksword
	elif PGS.Secondary == "hemwicksword":
		WeaponSecondary.texture = hemwicksword


	if PGS.Primary == "shovel":
		WeaponPrimary.texture = shovel

	elif PGS.Secondary == "shovel":
		WeaponSecondary.texture = shovel


	if PGS.Primary == "unarmed":
		$FramePrimary/EquipAnimPrimary.play("None")
	elif PGS.Secondary == "unarmed":
		$FrameSecondary/EquipAnimSecondary.play("None")

	if PGS.Primary == "fireball":
		WeaponPrimary.texture = fireball
	elif PGS.Secondary =="fireball":
		WeaponSecondary.texture = fireball

	if PGS.Primary == "bow":
		WeaponPrimary.texture = bow
	elif PGS.Secondary == "bow":
		WeaponSecondary.texture = bow


	if PGS.shield_buckler == true :
		pass

	if PGS.shield_heater == true :
		pass



