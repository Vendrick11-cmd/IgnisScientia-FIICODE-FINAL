extends StaticBody2D

var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
var ready = false

var rosemary = false
var ginseng = false
var ginger = false
var nettle = false
var thistle = false
var lavender = false
var yarrow = false
var comfrey = false
var valerian = false
var mugwort = false
var mandrake = false
var plantain = false
var garlic = false
var eyebright = false


onready var comfrey_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Comfrey/Amount
onready var eyebright_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Eyebright/Amount
onready var garlic_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Garlic/Amount
onready var ginger_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Ginger/Amount
onready var ginseng_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Ginseng/Amount
onready var lavender_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Lavender/Amount
onready var mandrake_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Mandrake/Amount
onready var mugwort_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Mugwort/Amount
onready var nettle_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Nettle/Amount
onready var plantain_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Plantain/Amount
onready var rosemary_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Rosemary/Amount
onready var thistle_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Thistle/Amount
onready var valerian_a = $"Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Valerian Root/Amount"
onready var yarrow_a = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Yarrow/Amount


onready var comfrey_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Comfrey
onready var eyebright_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Eyebright
onready var garlic_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Garlic
onready var ginger_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Ginger
onready var ginseng_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Ginseng
onready var lavender_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Lavender
onready var mandrake_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Mandrake
onready var mugwort_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Mugwort
onready var nettle_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Nettle
onready var plantain_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Plantain
onready var rosemary_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Rosemary
onready var thistle_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Thistle
onready var valerian_b = $"Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Valerian Root"
onready var yarrow_b = $Plants/ConfirmPanel/InventoryItems/Ingredients/VBoxContainer/Yarrow




# Called when the node enters the scene tree for the first time.
func _ready():
	$Planting.play("None")

func _physics_process(_delta):
	if ready == true and Input.is_action_just_pressed("Interact") and $InteractRay.is_colliding():
		var anim = randi() % 3
		match anim:
			0:$PickUp.play()
			1:$PickUp2.play()
			2:$PickUp3.play()
		PGS.PickUp = true
		if comfrey == true:
			InventoryLoad.comfrey += 2
			InventoryLoad.comfrey_seed += 2
			PGS.Name = "2x Comfrey"
			IAdd.start()
			PGS.Name = "2x Comfrey Seed"
			IAdd.start()

		elif eyebright == true:
			InventoryLoad.eyebright += 2
			InventoryLoad.eyebright_seed += 2
			PGS.Name = "2x Eyebright"
			IAdd.start()
			PGS.Name = "2x Eyebright Seed"
			IAdd.start()
		elif garlic == true:
			InventoryLoad.garlic += 2
			InventoryLoad.garlic_seed += 2
			PGS.Name = "2x Garlic"
			IAdd.start()
			PGS.Name = "2x Garlic Seed"
			IAdd.start()
		elif ginger == true:
			InventoryLoad.ginger += 1
			InventoryLoad.ginger_seed += 2
			PGS.Name = "1x Ginger"
			IAdd.start()
			PGS.Name = "2x Ginger Seed"
			IAdd.start()
		elif ginseng == true:
			InventoryLoad.ginseng += 1
			InventoryLoad.ginseng_seed += 2
			PGS.Name = "2x Ginseng"
			IAdd.start()
			PGS.Name = "2x Ginseng Seed"
			IAdd.start()
		elif lavender == true:
			InventoryLoad.lavender += 3
			InventoryLoad.lavender_seed += 2
			PGS.Name = "3x Lavender"
			IAdd.start()
			PGS.Name = "2x Lavender Seed"
			IAdd.start()
		elif mandrake == true:
			InventoryLoad.mandrake += 1
			InventoryLoad.mandrake_seed += 2
			PGS.Name = "1x Mandrake"
			IAdd.start()
			PGS.Name = "2x Mandrake Seed"
			IAdd.start()
		elif mugwort == true:
			InventoryLoad.mugwort += 2
			InventoryLoad.mugwort_seed += 2
			PGS.Name = "2x Mugwort"
			IAdd.start()
			PGS.Name = "2x Mugwort Seed"
			IAdd.start()
		elif nettle == true:
			InventoryLoad.nettle += 3
			InventoryLoad.nettle_seed += 3
			PGS.Name = "3x Nettle"
			IAdd.start()
			PGS.Name = "3x Nettle Seed"
			IAdd.start()
		elif plantain == true:
			InventoryLoad.plantain += 2
			InventoryLoad.plantain_seed += 3
			PGS.Name = "2x Plantain"
			IAdd.start()
			PGS.Name = "3x Plantain Seed"
			IAdd.start()
		elif rosemary == true:
			InventoryLoad.rosemary += 2
			InventoryLoad.rosemary_seed_seed += 2
			PGS.Name = "2x Rosemary"
			IAdd.start()
			PGS.Name = "2x Rosemary Seed"
			IAdd.start()
		elif thistle == true:
			InventoryLoad.thistle += 3
			InventoryLoad.thistle_seed += 2
			PGS.Name = "3x Thistle"
			IAdd.start()
			PGS.Name = "2x Thistle Seed"
			IAdd.start()
		elif valerian == true:
			InventoryLoad.valerian += 1
			InventoryLoad.valerian_seed += 2
			PGS.Name = "1x Valerian"
			IAdd.start()
			PGS.Name = "2x Valerian Seed"
			IAdd.start()
		elif yarrow == true:
			InventoryLoad.yarrow += 2
			InventoryLoad.yarrow_seed += 3
			PGS.Name = "2x Yarrow"
			IAdd.start()
			PGS.Name = "3x Yarrow Seed"
			IAdd.start()
		_reset()


	if self.visible == false:
		$InteractRay.enabled = false
	else:
		$InteractRay.enabled = true

	if Input.is_action_just_pressed("Interact") and $InteractRay.is_colliding() and ready == false and $Planting.current_animation == "None" and $PickUpArea/CollisionShape2D.disabled == false and PGS.inventory == false and PGS.charactermenu == false and PGS.alchemy == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)
		$Plants/AnimationPlayer.play("Active")
		PGS.in_dialogue = true
		get_tree().paused = true


	_visibility()


	comfrey_a.text = "%s" % [InventoryLoad.comfrey_seed]
	eyebright_a.text = "%s" % [InventoryLoad.eyebright_seed]
	garlic_a.text = "%s" % [InventoryLoad.garlic_seed]
	ginger_a.text = "%s" % [InventoryLoad.ginger_seed]
	ginseng_a.text = "%s" % [InventoryLoad.ginseng_seed]
	lavender_a.text = "%s" % [InventoryLoad.lavender_seed]
	mandrake_a.text = "%s" % [InventoryLoad.mandrake_seed]
	mugwort_a.text = "%s" % [InventoryLoad.mugwort_seed]
	nettle_a.text = "%s" % [InventoryLoad.nettle_seed]
	plantain_a.text = "%s" % [InventoryLoad.plantain_seed]
	rosemary_a.text = "%s" % [InventoryLoad.rosemary_seed]
	thistle_a.text = "%s" % [InventoryLoad.thistle_seed]
	valerian_a.text = "%s" % [InventoryLoad.valerian_seed]
	yarrow_a.text = "%s" % [InventoryLoad.yarrow_seed]

func _ready_to_harvest():
	ready = true

func _not_ready_to_harvest():
	ready = false

func _reset():
	$DigAnim.play("Inactive")
	$Planting.play("None")
	rosemary = false
	ginseng = false
	ginger = false
	nettle = false
	thistle = false
	lavender = false
	yarrow = false
	comfrey = false
	valerian = false
	mugwort = false
	mandrake = false
	plantain = false
	garlic = false
	eyebright = false

func _visibility():
	if InventoryLoad.comfrey_seed == 0:
		comfrey_b.visible = false
	else:
		comfrey_b.visible = true

	if InventoryLoad.eyebright_seed == 0:
		eyebright_b.visible = false
	else:
		eyebright_b.visible = true

	if InventoryLoad.garlic_seed == 0:
		garlic_b.visible = false
	else:
		garlic_b.visible = true

	if InventoryLoad.ginger_seed == 0:
		ginger_b.visible = false
	else:
		ginger_b.visible = true
	if InventoryLoad.ginseng_seed == 0:
		ginseng_b.visible = false
	else:
		ginseng_b.visible = true
	if InventoryLoad.lavender_seed == 0:
		lavender_b.visible = false
	else:
		lavender_b.visible = true
	if InventoryLoad.mandrake_seed == 0:
		mandrake_b.visible = false
	else:
		mandrake_b.visible = true
	if InventoryLoad.mugwort_seed == 0:
		mugwort_b.visible = false
	else:
		mugwort_b.visible = true
	if InventoryLoad.nettle_seed == 0:
		nettle_b.visible = false
	else:
		nettle_b.visible = true
	if InventoryLoad.plantain_seed == 0:
		plantain_b.visible = false
	else:
		plantain_b.visible = true
	if InventoryLoad.rosemary_seed == 0:
		rosemary_b.visible = false
	else:
		rosemary_b.visible = true
	if InventoryLoad.thistle_seed == 0:
		thistle_b.visible = false
	else:
		thistle_b.visible = true
	if InventoryLoad.valerian_seed == 0:
		valerian_b.visible = false
	else:
		valerian_b.visible = true
	if InventoryLoad.yarrow_seed == 0:
		yarrow_b.visible = false
	else:
		yarrow_b.visible = true

func _hide_cursor():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	PGS.in_dialogue = false
	get_tree().paused = false



func _on_Comfrey_pressed():
	comfrey = true
	InventoryLoad.comfrey_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Comfrey")


func _on_Eyebright_pressed():
	eyebright = true
	InventoryLoad.eyebright_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Eyebright")

func _on_Garlic_pressed():
	garlic = true
	InventoryLoad.garlic_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Garlic")

func _on_Ginger_pressed():
	ginger = true
	InventoryLoad.ginger_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Ginger")

func _on_Ginseng_pressed():
	ginseng = true
	InventoryLoad.ginseng_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Ginseng")

func _on_Lavender_pressed():
	lavender = true
	InventoryLoad.lavender_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Lavender")

func _on_Mandrake_pressed():
	mandrake = true
	InventoryLoad.mandrake_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Mandrake")

func _on_Mugwort_pressed():
	mugwort = true
	InventoryLoad.mugwort_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Mugwort")

func _on_Nettle_pressed():
	nettle = true
	InventoryLoad.nettle_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Nettle")

func _on_Plantain_pressed():
	plantain = true
	InventoryLoad.plantain_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Plantain")

func _on_Rosemary_pressed():
	rosemary = true
	InventoryLoad.rosemary_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Rosemary")

func _on_Thistle_pressed():
	thistle = true
	InventoryLoad.thistle_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Thistle")

func _on_Valerian_Root_pressed():
	valerian = true
	InventoryLoad.valerian_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Valerian")

func _on_Yarrow_pressed():
	yarrow = true
	InventoryLoad.yarrow_seed -= 1
	$Plants/AnimationPlayer.play("Inactive")
	_hide_cursor()
	$AddIngredient.play()
	$AddIngredient.pitch_scale = rand_range(0.8, 1.2)
	$Planting.play("Yarrow")




func _on_Comfrey_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Comfrey")
	$Hover.play()

func _on_Comfrey_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Comfrey")
	$Hover.play()

func _on_Eyebright_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Eyebright")
	$Hover.play()

func _on_Eyebright_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Eyebright")
	$Hover.play()

func _on_Garlic_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Garlic")
	$Hover.play()

func _on_Garlic_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Garlic")
	$Hover.play()

func _on_Ginger_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Ginger")
	$Hover.play()

func _on_Ginger_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Ginger")
	$Hover.play()

func _on_Ginseng_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Ginseng")
	$Hover.play()

func _on_Ginseng_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Ginseng")
	$Hover.play()

func _on_Lavender_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Lavender")
	$Hover.play()

func _on_Lavender_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Lavender")
	$Hover.play()

func _on_Mandrake_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Mandrake")
	$Hover.play()

func _on_Mandrake_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Mandrake")
	$Hover.play()

func _on_Mugwort_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Mugwort")
	$Hover.play()

func _on_Mugwort_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Mugwort")
	$Hover.play()

func _on_Nettle_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Nettle")
	$Hover.play()

func _on_Nettle_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Nettle")
	$Hover.play()

func _on_Plantain_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Plantain")
	$Hover.play()

func _on_Plantain_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Plantain")
	$Hover.play()

func _on_Rosemary_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Rosemary")
	$Hover.play()

func _on_Rosemary_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Rosemary")
	$Hover.play()
func _on_Thistle_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Thistle")
	$Hover.play()

func _on_Thistle_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Thistle")
	$Hover.play()

func _on_Valerian_Root_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Valerian")
	$Hover.play()

func _on_Valerian_Root_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Valerian")
	$Hover.play()

func _on_Yarrow_focus_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Yarrow")
	$Hover.play()

func _on_Yarrow_mouse_entered():
	$Plants/ConfirmPanel/ItemDesc/DescAnim.play("Yarrow")
	$Hover.play()


func _on_Area2D_area_entered(_area):
	$DigAnim.play("Active")
	self.visible = true
