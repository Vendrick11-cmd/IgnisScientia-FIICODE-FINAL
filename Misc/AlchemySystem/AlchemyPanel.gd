extends TextureRect

onready var lav_amount = $InventoryItems/Ingredients/VBoxContainer/Lavender/Amount
onready var nettle_amount = $InventoryItems/Ingredients/VBoxContainer/Nettle/Amount
onready var rosemary_amount = $InventoryItems/Ingredients/VBoxContainer/Rosemary/Amount
onready var comfrey_amount = $InventoryItems/Ingredients/VBoxContainer/Comfrey/Amount
onready var thistle_amount = $InventoryItems/Ingredients/VBoxContainer/Thistle/Amount
onready var yarrow_amount = $InventoryItems/Ingredients/VBoxContainer/Yarrow/Amount
onready var ginger_amount = $InventoryItems/Ingredients/VBoxContainer/Ginger/Amount
onready var ginseng_amount = $InventoryItems/Ingredients/VBoxContainer/Ginseng/Amount
onready var charcoal_amount = $InventoryItems/Ingredients/VBoxContainer/Charcoal/Amount
onready var valerian_amount = $InventoryItems/Ingredients/VBoxContainer/ValerianRoot/Amount
onready var mugwort_amount = $InventoryItems/Ingredients/VBoxContainer/Mugwort/Amount
onready var blue_lotus_amount = $InventoryItems/Ingredients/VBoxContainer/BlueLotus/Amount
onready var mandrake_amount = $InventoryItems/Ingredients/VBoxContainer/Mandrake/Amount
onready var honey_amount = $InventoryItems/Ingredients/VBoxContainer/Honey/Amount
onready var plantain_amount = $InventoryItems/Ingredients/VBoxContainer/Plantain/Amount
onready var billberry_amount = $InventoryItems/Ingredients/VBoxContainer/Billberry/Amount
onready var garlic_amount = $InventoryItems/Ingredients/VBoxContainer/Garlic/Amount
onready var eyebright_amount = $InventoryItems/Ingredients/VBoxContainer/Eyebright/Amount
onready var bonemeal_amount = $InventoryItems/Ingredients/VBoxContainer/BoneMeal/Amount
onready var bones_amount = $InventoryItems/Ingredients/VBoxContainer/Bones/Amount
onready var bonemarrow_amount = $InventoryItems/Ingredients/VBoxContainer/BoneMarrow/Amount
onready var luckyclover_amount = $InventoryItems/Ingredients/VBoxContainer/LuckyClover/Amount

onready var lav = $InventoryItems/Ingredients/VBoxContainer/Lavender
onready var nettle = $InventoryItems/Ingredients/VBoxContainer/Nettle
onready var rosemary = $InventoryItems/Ingredients/VBoxContainer/Rosemary
onready var comfrey = $InventoryItems/Ingredients/VBoxContainer/Comfrey
onready var thistle = $InventoryItems/Ingredients/VBoxContainer/Thistle
onready var yarrow = $InventoryItems/Ingredients/VBoxContainer/Yarrow
onready var ginger = $InventoryItems/Ingredients/VBoxContainer/Ginger
onready var ginseng = $InventoryItems/Ingredients/VBoxContainer/Ginseng
onready var charcoal =$InventoryItems/Ingredients/VBoxContainer/Charcoal
onready var valerian = $InventoryItems/Ingredients/VBoxContainer/ValerianRoot
onready var mugwort = $InventoryItems/Ingredients/VBoxContainer/Mugwort
onready var blue_lotus = $InventoryItems/Ingredients/VBoxContainer/BlueLotus
onready var mandrake = $InventoryItems/Ingredients/VBoxContainer/Mandrake
onready var honey = $InventoryItems/Ingredients/VBoxContainer/Honey
onready var plantain = $InventoryItems/Ingredients/VBoxContainer/Plantain
onready var billberry = $InventoryItems/Ingredients/VBoxContainer/Billberry
onready var garlic = $InventoryItems/Ingredients/VBoxContainer/Garlic
onready var eyebright = $InventoryItems/Ingredients/VBoxContainer/Eyebright
onready var bonemeal = $InventoryItems/Ingredients/VBoxContainer/BoneMeal
onready var bones = $InventoryItems/Ingredients/VBoxContainer/Bones
onready var bonemarrow = $InventoryItems/Ingredients/VBoxContainer/BoneMarrow
onready var luckyclover = $InventoryItems/Ingredients/VBoxContainer/LuckyClover


onready var recipepotionhealth = $InventoryItems/Potions/VBoxContainer/HealthPotion
onready var recipepotionmana = $InventoryItems/Potions/VBoxContainer/ManaPotion
onready var recipepotionhealthvial = $InventoryItems/Potions/VBoxContainer/HealthVial
onready var recipepotionhealthbig = $InventoryItems/Potions/VBoxContainer/BigHealthPotion
onready var recipepotionregenhealth = $InventoryItems/Potions/VBoxContainer/RegenPotion
onready var recipepotionbindingdecoc = $InventoryItems/Potions/VBoxContainer/WoundBindDecoc
onready var recipepotionlife = $InventoryItems/Potions/VBoxContainer/LifePotion
onready var recipepotionregenbig = $InventoryItems/Potions/VBoxContainer/BigRegenPotion
onready var recipepurifelixir = $InventoryItems/Potions/VBoxContainer/PurifElixir
onready var recipepotionfireres = $InventoryItems/Potions/VBoxContainer/FireResPotion
onready var recipepotionrejuv = $InventoryItems/Potions/VBoxContainer/RejuvPotion
onready var recipepotionundyingelixir = $InventoryItems/Potions/VBoxContainer/UndyingElixir
onready var recipepotionsimplepoison = $InventoryItems/Poisons/VBoxContainer/SimplePoison
onready var recipepotionvenomvial = $InventoryItems/Poisons/VBoxContainer/VenomVial
onready var recipepotionbleedthorn = $InventoryItems/Poisons/VBoxContainer/BleedingThorn
onready var recipepotiontirelessbrew = $InventoryItems/Potions/VBoxContainer/TirelessBrew
onready var recipepotionstamina = $InventoryItems/Potions/VBoxContainer/StaminaPotion
onready var recipepotionpotentstamina = $InventoryItems/Potions/VBoxContainer/PotentStaminaPotion
onready var recipepotionhunting = $InventoryItems/Potions/VBoxContainer/HuntingPotion
onready var recipepotionawareness = $InventoryItems/Potions/VBoxContainer/AwarenessBrew
onready var recipepotiondreamwalker = $InventoryItems/Potions/VBoxContainer/DreamwalkerElixir
onready var recipepotionmanabig = $InventoryItems/Potions/VBoxContainer/BigManaPotion
onready var recipepotionmanaalt = $InventoryItems/Potions/VBoxContainer/ManaPotionAlt
onready var recipepotionluck = $InventoryItems/Potions/VBoxContainer/LuckPotion
onready var recipepotioninvis = $InventoryItems/Potions/VBoxContainer/InvisibilityElixir
onready var recipepotionvenompurge = $InventoryItems/Antidotes/VBoxContainer/VenomPurgeElixir
onready var recipepotionplagueward = $InventoryItems/Antidotes/VBoxContainer/PlagueWardPotion
onready var recipepotionblossom = $InventoryItems/Potions/VBoxContainer/BlossomBrew

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	_visibility()
	luckyclover_amount.text = "%s" % [InventoryLoad.lucky_clover]
	bonemarrow_amount.text = "%s" % [InventoryLoad.bonemarrow]
	bones_amount.text = "%s" % [InventoryLoad.bones]
	bonemeal_amount.text = "%s" % [InventoryLoad.bonemeal]
	eyebright_amount.text = "%s" % [InventoryLoad.eyebright]
	garlic_amount.text = "%s" % [InventoryLoad.garlic]
	billberry_amount.text = "%s" % [InventoryLoad.billberry]
	plantain_amount.text = "%s" % [InventoryLoad.plantain]
	honey_amount.text = "%s" % [InventoryLoad.honey]
	lav_amount.text = "%s" % [InventoryLoad.lavender]
	nettle_amount.text = "%s" % [InventoryLoad.nettle]
	rosemary_amount.text = "%s" % [InventoryLoad.rosemary]
	comfrey_amount.text = "%s" % [InventoryLoad.comfrey]
	thistle_amount.text = "%s" % [InventoryLoad.thistle]
	yarrow_amount.text = "%s" % [InventoryLoad.yarrow]
	ginger_amount.text = "%s" % [InventoryLoad.ginger]
	ginseng_amount.text = "%s" % [InventoryLoad.ginseng]
	charcoal_amount.text = "%s" % [InventoryLoad.charcoal]
	valerian_amount.text = "%s" % [InventoryLoad.valerian]
	mugwort_amount.text = "%s" % [InventoryLoad.mugwort]
	blue_lotus_amount.text = "%s" % [InventoryLoad.blue_lotus]
	mandrake_amount.text = "%s" % [InventoryLoad.mandrake]


func _visibility():
	if InventoryLoad.recipepotionhealth  == false:
		recipepotionhealth.visible = false
	else:
		recipepotionhealth.visible = true

	if InventoryLoad.recipepotionmana   == false:
		recipepotionmana.visible = false
	else:
		recipepotionmana.visible = true

	if InventoryLoad.recipepotionhealthvial  == false:
		recipepotionhealthvial.visible = false
	else:
		recipepotionhealthvial.visible = true

	if InventoryLoad.recipepotionhealthbig  == false:
		recipepotionhealthbig.visible = false
	else:
		recipepotionhealthbig.visible = true

	if InventoryLoad.recipepotionregenhealth == false:
		recipepotionregenhealth.visible = false
	else:
		recipepotionregenhealth.visible = true

	if InventoryLoad.recipepotionbindingdecoc == false:
		recipepotionbindingdecoc.visible = false
	else:
		recipepotionbindingdecoc.visible = true

	if InventoryLoad.recipepotionlife == false:
		recipepotionlife.visible = false
	else:
		recipepotionlife.visible = true

	if InventoryLoad.recipepotionregenbig == false:
		recipepotionregenbig.visible = false
	else:
		recipepotionregenbig.visible = true

	if InventoryLoad.recipepurifelixir == false:
		recipepurifelixir.visible = false
	else:
		recipepurifelixir.visible = true

	if InventoryLoad.recipepotionfireres == false:
		recipepotionfireres.visible = false
	else:
		recipepotionfireres.visible = true

	if InventoryLoad.recipepotionrejuv == false:
		recipepotionrejuv.visible = false
	else:
		recipepotionrejuv.visible = true

	if InventoryLoad.recipepotionundyingelixir == false:
		recipepotionundyingelixir.visible = false
	else:
		recipepotionundyingelixir.visible = true

	if InventoryLoad.recipepotionsimplepoison == false:
		recipepotionsimplepoison.visible = false
	else:
		recipepotionsimplepoison.visible = true

	if InventoryLoad.recipepotionvenomvial == false:
		recipepotionvenomvial.visible = false
	else:
		recipepotionvenomvial.visible = true

	if InventoryLoad.recipepotionbleedthorn == false:
		recipepotionbleedthorn.visible = false
	else:
		recipepotionbleedthorn.visible = true

	if InventoryLoad.recipepotiontirelessbrew == false:
		recipepotiontirelessbrew.visible = false
	else:
		recipepotiontirelessbrew.visible = true

	if InventoryLoad.recipepotionstamina == false:
		recipepotionstamina.visible = false
	else:
		recipepotionstamina.visible = true

	if InventoryLoad.recipepotionpotentstamina == false:
		recipepotionpotentstamina.visible = false
	else:
		recipepotionpotentstamina.visible = true

	if InventoryLoad.recipepotionhunting == false:
		recipepotionhunting.visible = false
	else:
		recipepotionhunting.visible = true

	if InventoryLoad.recipepotionawareness == false:
		recipepotionawareness.visible = false
	else:
		recipepotionawareness.visible = true

	if InventoryLoad.recipepotiondreamwalker == false:
		recipepotiondreamwalker.visible = false
	else:
		recipepotiondreamwalker.visible = true

	if InventoryLoad.recipepotionmanabig == false:
		recipepotionmanabig.visible = false
	else:
		recipepotionmanabig.visible = true

	if InventoryLoad.recipepotionmanaalt == false:
		recipepotionmanaalt.visible = false
	else:
		recipepotionmanaalt.visible = true

	if InventoryLoad.recipepotionluck == false:
		recipepotionluck.visible = false
	else:
		recipepotionluck.visible = true

	if InventoryLoad.recipepotioninvis == false:
		recipepotioninvis.visible = false
	else:
		recipepotioninvis.visible = true

	if InventoryLoad.recipepotionvenompurge == false:
		recipepotionvenompurge.visible = false
	else:
		recipepotionvenompurge.visible = true

	if InventoryLoad.recipepotionplagueward == false:
		recipepotionplagueward.visible = false
	else:
		recipepotionplagueward.visible = true

	if InventoryLoad.recipepotionblossom == false:
		recipepotionblossom.visible = false
	else:
		recipepotionblossom.visible = true


	if InventoryLoad.lucky_clover == 0:
		luckyclover.visible = false
	else: luckyclover.visible = true
	if InventoryLoad.bonemeal == 0:
		bonemeal.visible = false
	else: bonemeal.visible = true
	if InventoryLoad.bones == 0:
		bones.visible = false
	else: bones.visible = true
	if InventoryLoad.bonemarrow == 0:
		bonemarrow.visible = false
	else: bonemarrow.visible = true
	if InventoryLoad.eyebright == 0:
		eyebright.visible = false
	else: eyebright.visible = true
	if InventoryLoad.garlic == 0:
		garlic.visible = false
	else: garlic.visible = true
	if InventoryLoad.billberry == 0:
		billberry.visible = false
	else: billberry.visible = true
	if InventoryLoad.plantain == 0:
		plantain.visible = false
	else: plantain.visible = true

	if InventoryLoad.honey == 0:
		honey.visible = false
	else: honey.visible = true

	if InventoryLoad.lavender == 0:
		lav.visible = false
	else: lav.visible = true

	if InventoryLoad.nettle == 0:
		nettle.visible = false
	else: nettle.visible = true

	if InventoryLoad.rosemary == 0:
		rosemary.visible = false
	else: rosemary.visible = true

	if InventoryLoad.comfrey == 0:
		comfrey.visible = false
	else: comfrey.visible = true

	if InventoryLoad.thistle == 0:
		thistle.visible = false
	else: thistle.visible = true

	if InventoryLoad.yarrow == 0:
		yarrow.visible = false
	else: yarrow.visible = true

	if InventoryLoad.ginger == 0:
		ginger.visible = false
	else: ginger.visible = true

	if InventoryLoad.ginseng == 0:
		ginseng.visible = false
	else: ginseng.visible = true
	if InventoryLoad.charcoal == 0:
		charcoal.visible = false
	else: charcoal.visible = true
	if InventoryLoad.valerian == 0:
		valerian.visible = false
	else : valerian.visible = true
	if InventoryLoad.mugwort == 0:
		mugwort.visible = false
	else: mugwort.visible = true
	if InventoryLoad.blue_lotus == 0:
		blue_lotus.visible = false
	else: blue_lotus.visible = true
	if InventoryLoad.mandrake == 0:
		mandrake.visible = false
	else: mandrake.visible = true


func _on_Lavender_pressed():
	if $Ingredients/Lavender.visible == true:
		ALC.lavender = false
		InventoryLoad.lavender += 1
		$Ingredients/Lavender.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)
func _on_Nettle_pressed():
	if $Ingredients/Nettle.visible == true:
		ALC.nettle = false
		InventoryLoad.nettle += 1
		$Ingredients/Nettle.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)
func _on_Rosemary_pressed():
	if $Ingredients/Rosemary.visible == true:
		ALC.rosemary = false
		InventoryLoad.rosemary += 1
		$Ingredients/Rosemary.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)
func _on_Comfrey_pressed():
	if $Ingredients/Comfrey.visible == true:
		InventoryLoad.comfrey += 1
		$Ingredients/Comfrey.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Thistle_pressed():
	if $Ingredients/Thistle.visible == true:
		InventoryLoad.thistle += 1
		$Ingredients/Thistle.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Yarrow_pressed():
	if $Ingredients/Yarrow.visible == true:
		InventoryLoad.yarrow += 1
		$Ingredients/Yarrow.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Ginger_pressed():
	if $Ingredients/Ginger.visible == true:
		InventoryLoad.ginger += 1
		$Ingredients/Ginger.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Ginseng_pressed():
	if $Ingredients/Ginseng.visible == true:
		InventoryLoad.ginseng += 1
		$Ingredients/Ginseng.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Charcoal_pressed():
	if $Ingredients/Charcoal.visible == true:
		InventoryLoad.charcoal += 1
		$Ingredients/Charcoal.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Valerian_Root_pressed():
	if $Ingredients/ValerianRoot.visible == true:
		InventoryLoad.valerian += 1
		$Ingredients/ValerianRoot.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Mugwort_pressed():
	if $Ingredients/Mugwort.visible == true:
		InventoryLoad.mugwort += 1
		$Ingredients/Mugwort.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Blue_Lotus_pressed():
	if $Ingredients/BlueLotus.visible == true:
		InventoryLoad.blue_lotus += 1
		$Ingredients/BlueLotus.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Mandrake_pressed():
	if $Ingredients/Mandrake.visible == true:
		InventoryLoad.mandrake += 1
		$Ingredients/Mandrake.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Honey_pressed():
	if $Ingredients/Honey.visible == true:
		InventoryLoad.honey += 1
		$Ingredients/Honey.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Plantain_pressed():
	if $Ingredients/Plantain.visible == true:
		InventoryLoad.plantain += 1
		$Ingredients/Plantain.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Billberry_pressed():
	if $Ingredients/Billberry.visible == true:
		InventoryLoad.billberry += 1
		$Ingredients/Billberry.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Garlic_pressed():
	if $Ingredients/Garlic.visible == true:
		InventoryLoad.garlic += 1
		$Ingredients/Garlic.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Eyebright_pressed():
	if $Ingredients/Eyebright.visible == true:
		InventoryLoad.eyebright += 1
		$Ingredients/Eyebright.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_BoneMeal_pressed():
	if $Ingredients/BoneMeal.visible == true:
		InventoryLoad.bonemeal += 1
		$Ingredients/BoneMeal.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_LuckyClover_pressed():
	if $Ingredients/LuckyClover.visible == true:
		InventoryLoad.lucky_clover += 1
		$Ingredients/LuckyClover.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_BoneMarrow_pressed():
	if $Ingredients/BoneMarrow.visible == true:
		InventoryLoad.bonemarrow += 1
		$Ingredients/BoneMarrow.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)

func _on_Bones_pressed():
	if $Ingredients/Bones.visible == true:
		InventoryLoad.bones += 1
		$Ingredients/Bones.visible = false
		$"../Sounds/RemoveIngredient".play()
		$"../Sounds/RemoveIngredient".pitch_scale = rand_range(0.8, 1.2)
