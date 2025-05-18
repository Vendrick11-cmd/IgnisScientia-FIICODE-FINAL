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
onready var valerian_amount = $"InventoryItems/Ingredients/VBoxContainer/Valerian Root/Amount"
onready var mugwort_amount = $InventoryItems/Ingredients/VBoxContainer/Mugwort/Amount
onready var blue_lotus_amount = $"InventoryItems/Ingredients/VBoxContainer/Blue Lotus/Amount"
onready var mandrake_amount = $InventoryItems/Ingredients/VBoxContainer/Mandrake/Amount
onready var potionhealth_amount =$InventoryItems/Potions/VBoxContainer/HealthPotion/Amount
onready var bread_amount = $InventoryItems/Victuals/VBoxContainer/Bread/Amount
onready var wine_amount = $InventoryItems/Victuals/VBoxContainer/Wine/Amount
onready var cheapwine_amount = $InventoryItems/Victuals/VBoxContainer/CheapWine/Amount
onready var finewine_amount = $InventoryItems/Victuals/VBoxContainer/FineWine/Amount
onready var rawmeat_amount = $InventoryItems/Victuals/VBoxContainer/RawMeat/Amount
onready var potionmana_amount = $InventoryItems/Potions/VBoxContainer/ManaPotion/Amount
onready var honey_amount = $InventoryItems/Ingredients/VBoxContainer/Honey/Amount
onready var plantain_amount = $InventoryItems/Ingredients/VBoxContainer/Plantain/Amount
onready var billberry_amount = $InventoryItems/Ingredients/VBoxContainer/Billberry/Amount
onready var garlic_amount = $InventoryItems/Ingredients/VBoxContainer/Garlic/Amount
onready var eyebright_amount = $InventoryItems/Ingredients/VBoxContainer/Eyebright/Amount
onready var bonemeal_amount = $InventoryItems/Ingredients/VBoxContainer/BoneMeal/Amount
onready var bones_amount = $InventoryItems/Ingredients/VBoxContainer/Bones/Amount
onready var bonemarrow_amount = $InventoryItems/Ingredients/VBoxContainer/BoneMarrow/Amount
onready var luckyclover_amount = $InventoryItems/Ingredients/VBoxContainer/LuckyClover/Amount
onready var healthvial_a = $InventoryItems/Potions/VBoxContainer/HealthVial/Amount
onready var bighealth_a = $InventoryItems/Potions/VBoxContainer/BigHealthPotion/Amount
onready var regenpotion_a = $InventoryItems/Potions/VBoxContainer/RegenPotion/Amount
onready var woundbindpotion_a = $InventoryItems/Potions/VBoxContainer/WoundBindDecoc/Amount
onready var lifepotion_a = $InventoryItems/Potions/VBoxContainer/LifePotion/Amount
onready var bigregenpotion_a = $InventoryItems/Potions/VBoxContainer/BigRegenPotion/Amount
onready var purifelixir_a = $InventoryItems/Potions/VBoxContainer/PurifElixir/Amount
onready var firerespotion_a = $InventoryItems/Potions/VBoxContainer/FireResPotion/Amount
onready var rejuvpotion_a = $InventoryItems/Potions/VBoxContainer/RejuvPotion/Amount
onready var undyingelixir_a = $InventoryItems/Potions/VBoxContainer/UndyingElixir/Amount
onready var simplepoison_a = $InventoryItems/Potions/VBoxContainer/SimplePoison/Amount
onready var venomvial_a = $InventoryItems/Potions/VBoxContainer/VenomVial/Amount
onready var bleedthorn_a = $InventoryItems/Potions/VBoxContainer/BleedingThorn/Amount
onready var tirelessbrew_a = $InventoryItems/Potions/VBoxContainer/TirelessBrew/Amount
onready var staminapotion_a = $InventoryItems/Potions/VBoxContainer/StaminaPotion/Amount
onready var potentstaminapotion_a = $InventoryItems/Potions/VBoxContainer/PotentStaminaPotion/Amount
onready var huntingpotion_a = $InventoryItems/Potions/VBoxContainer/HuntingPotion/Amount
onready var awarepotion_a = $InventoryItems/Potions/VBoxContainer/AwarenessBrew/Amount
onready var dreampotion_a = $InventoryItems/Potions/VBoxContainer/DreamwalkerElixir/Amount
onready var bigmanapotion_a = $InventoryItems/Potions/VBoxContainer/BigManaPotion/Amount
onready var luckpotion_a = $InventoryItems/Potions/VBoxContainer/LuckPotion/Amount
onready var inviselixir_a = $InventoryItems/Potions/VBoxContainer/InvisibilityElixir/Amount
onready var venompurge_a = $InventoryItems/Potions/VBoxContainer/VenomPurgeElixir/Amount
onready var plaguewardpotion_a = $InventoryItems/Potions/VBoxContainer/PlagueWardPotion/Amount
onready var blossombrew_a = $InventoryItems/Potions/VBoxContainer/BlossomBrew/Amount

onready var healthvial = $InventoryItems/Potions/VBoxContainer/HealthVial
onready var bighealth = $InventoryItems/Potions/VBoxContainer/BigHealthPotion
onready var regenpotion = $InventoryItems/Potions/VBoxContainer/RegenPotion
onready var woundbindpotion = $InventoryItems/Potions/VBoxContainer/WoundBindDecoc
onready var lifepotion = $InventoryItems/Potions/VBoxContainer/LifePotion
onready var bigregenpotion = $InventoryItems/Potions/VBoxContainer/BigRegenPotion
onready var purifelixir = $InventoryItems/Potions/VBoxContainer/PurifElixir
onready var firerespotion = $InventoryItems/Potions/VBoxContainer/FireResPotion
onready var rejuvpotion = $InventoryItems/Potions/VBoxContainer/RejuvPotion
onready var undyingelixir = $InventoryItems/Potions/VBoxContainer/UndyingElixir
onready var simplepoison = $InventoryItems/Potions/VBoxContainer/SimplePoison
onready var venomvial = $InventoryItems/Potions/VBoxContainer/VenomVial
onready var bleedthorn = $InventoryItems/Potions/VBoxContainer/BleedingThorn
onready var tirelessbrew = $InventoryItems/Potions/VBoxContainer/TirelessBrew
onready var staminapotion = $InventoryItems/Potions/VBoxContainer/StaminaPotion
onready var potentstaminapotion = $InventoryItems/Potions/VBoxContainer/PotentStaminaPotion
onready var huntingpotion = $InventoryItems/Potions/VBoxContainer/HuntingPotion
onready var awarepotion = $InventoryItems/Potions/VBoxContainer/AwarenessBrew
onready var dreampotion = $InventoryItems/Potions/VBoxContainer/DreamwalkerElixir
onready var bigmanapotion = $InventoryItems/Potions/VBoxContainer/BigManaPotion
onready var luckpotion = $InventoryItems/Potions/VBoxContainer/LuckPotion
onready var inviselixir = $InventoryItems/Potions/VBoxContainer/InvisibilityElixir
onready var venompurge = $InventoryItems/Potions/VBoxContainer/VenomPurgeElixir
onready var plaguewardpotion = $InventoryItems/Potions/VBoxContainer/PlagueWardPotion
onready var blossombrew = $InventoryItems/Potions/VBoxContainer/BlossomBrew
onready var lav = $InventoryItems/Ingredients/VBoxContainer/Lavender
onready var nettle = $InventoryItems/Ingredients/VBoxContainer/Nettle
onready var rosemary = $InventoryItems/Ingredients/VBoxContainer/Rosemary
onready var comfrey = $InventoryItems/Ingredients/VBoxContainer/Comfrey
onready var thistle = $InventoryItems/Ingredients/VBoxContainer/Thistle
onready var yarrow = $InventoryItems/Ingredients/VBoxContainer/Yarrow
onready var ginger = $InventoryItems/Ingredients/VBoxContainer/Ginger
onready var ginseng = $InventoryItems/Ingredients/VBoxContainer/Ginseng
onready var charcoal =$InventoryItems/Ingredients/VBoxContainer/Charcoal
onready var valerian = $"InventoryItems/Ingredients/VBoxContainer/Valerian Root"
onready var mugwort = $InventoryItems/Ingredients/VBoxContainer/Mugwort
onready var blue_lotus = $"InventoryItems/Ingredients/VBoxContainer/Blue Lotus"
onready var mandrake = $InventoryItems/Ingredients/VBoxContainer/Mandrake
onready var potionhealth = $InventoryItems/Potions/VBoxContainer/HealthPotion
onready var bread = $InventoryItems/Victuals/VBoxContainer/Bread
onready var wine = $InventoryItems/Victuals/VBoxContainer/Wine
onready var cheapwine = $InventoryItems/Victuals/VBoxContainer/CheapWine
onready var finewine = $InventoryItems/Victuals/VBoxContainer/FineWine
onready var rawmeat = $InventoryItems/Victuals/VBoxContainer/RawMeat
onready var potionmana = $InventoryItems/Potions/VBoxContainer/ManaPotion
onready var honey = $InventoryItems/Ingredients/VBoxContainer/Honey
onready var plantain = $InventoryItems/Ingredients/VBoxContainer/Plantain
onready var billberry = $InventoryItems/Ingredients/VBoxContainer/Billberry
onready var garlic = $InventoryItems/Ingredients/VBoxContainer/Garlic
onready var eyebright = $InventoryItems/Ingredients/VBoxContainer/Eyebright
onready var bonemeal = $InventoryItems/Ingredients/VBoxContainer/BoneMeal
onready var bones = $InventoryItems/Ingredients/VBoxContainer/Bones
onready var bonemarrow = $InventoryItems/Ingredients/VBoxContainer/BoneMarrow
onready var luckyclover = $InventoryItems/Ingredients/VBoxContainer/LuckyClover


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	_visibility()
	healthvial_a.text = "%s" % [InventoryLoad.potionhealthvial]
	bighealth_a.text = "%s" % [InventoryLoad.potionhealthbig]
	regenpotion_a.text = "%s" % [InventoryLoad.potionregenhealth]
	woundbindpotion_a.text = "%s" % [InventoryLoad.potionbindingdecoc]
	lifepotion_a.text = "%s" % [InventoryLoad.potionlife]
	bigregenpotion_a.text = "%s" % [InventoryLoad.potionregenbig]
	purifelixir_a.text = "%s" % [InventoryLoad.purifelixir]
	firerespotion_a.text = "%s" % [InventoryLoad.potionfireres]
	rejuvpotion_a.text = "%s" % [InventoryLoad.potionrejuv]
	undyingelixir_a.text = "%s" % [InventoryLoad.potionundyingelixir]
	simplepoison_a.text = "%s" % [InventoryLoad.potionsimplepoison]
	venomvial_a.text = "%s" % [InventoryLoad.potionvenomvial]
	bleedthorn_a.text = "%s" % [InventoryLoad.potionbleedthorn]
	tirelessbrew_a.text = "%s" % [InventoryLoad.potiontirelessbrew]
	staminapotion_a.text = "%s" % [InventoryLoad.potionstamina]
	potentstaminapotion_a.text = "%s" % [InventoryLoad.potionpotentstamina]
	huntingpotion_a.text = "%s" % [InventoryLoad.potionhunting]
	awarepotion_a.text = "%s" % [InventoryLoad.potionawareness]
	dreampotion_a.text = "%s" % [InventoryLoad.potiondreamwalker]
	bigmanapotion_a.text = "%s" % [InventoryLoad.potionmanabig]
	luckpotion_a.text = "%s" % [InventoryLoad.potionluck]
	inviselixir_a.text = "%s" % [InventoryLoad.potioninvis]
	venompurge_a.text = "%s" % [InventoryLoad.potionvenompurge]
	plaguewardpotion_a.text = "%s" % [InventoryLoad.potionplagueward]
	blossombrew_a.text = "%s" % [InventoryLoad.potionblossom]
	luckyclover_amount.text = "%s" % [InventoryLoad.lucky_clover]
	bonemarrow_amount.text = "%s" % [InventoryLoad.bonemarrow]
	bones_amount.text = "%s" % [InventoryLoad.bones]
	bonemeal_amount.text = "%s" % [InventoryLoad.bonemeal]
	eyebright_amount.text = "%s" % [InventoryLoad.eyebright]
	garlic_amount.text = "%s" % [InventoryLoad.garlic]
	billberry_amount.text = "%s" % [InventoryLoad.billberry]
	plantain_amount.text = "%s" % [InventoryLoad.plantain]
	honey_amount.text = "%s" % [InventoryLoad.honey]
	potionmana_amount.text = "%s" % [InventoryLoad.potionmana]
	rawmeat_amount.text = "%s" % [InventoryLoad.rawmeat]
	bread_amount.text = "%s" % [InventoryLoad.bread]
	wine_amount.text = "%s" % [InventoryLoad.wine]
	cheapwine_amount.text = "%s" % [InventoryLoad.cheapwine]
	finewine_amount.text = "%s" % [InventoryLoad.finewine]
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
	potionhealth_amount.text = "%s" % [InventoryLoad.potionhealth]


func _visibility():
	if InventoryLoad.potionlife == 0:
		lifepotion.visible = false
	else: lifepotion.visible = true
	if InventoryLoad.potionregenbig == 0:
		bigregenpotion.visible = false
	else: bigregenpotion.visible = true
	if InventoryLoad.purifelixir == 0:
		purifelixir.visible = false
	else: purifelixir.visible = true
	if InventoryLoad.potionfireres == 0:
		firerespotion.visible = false
	else: firerespotion.visible = true
	if InventoryLoad.potionrejuv == 0:
		rejuvpotion.visible = false
	else: rejuvpotion.visible = true
	if InventoryLoad.potionundyingelixir == 0:
		undyingelixir.visible = false
	else: undyingelixir.visible = true
	if InventoryLoad.potionsimplepoison == 0:
		simplepoison.visible = false
	else: simplepoison.visible = true
	if InventoryLoad.potionvenomvial == 0:
		venomvial.visible = false
	else: venomvial.visible = true
	if InventoryLoad.potionbleedthorn == 0:
		bleedthorn.visible = false
	else: bleedthorn.visible = true
	if InventoryLoad.potiontirelessbrew == 0:
		tirelessbrew.visible = false
	else: tirelessbrew.visible = true
	if InventoryLoad.potionstamina == 0:
		staminapotion.visible = false
	else: staminapotion.visible = true
	if InventoryLoad.potionpotentstamina == 0:
		potentstaminapotion.visible = false
	else: potentstaminapotion.visible = true
	if InventoryLoad.potionhunting == 0:
		huntingpotion.visible = false
	else: huntingpotion.visible = true
	if InventoryLoad.potionawareness == 0:
		awarepotion.visible = false
	else: awarepotion.visible = true
	if InventoryLoad.potiondreamwalker == 0:
		dreampotion.visible = false
	else: dreampotion.visible = true
	if InventoryLoad.potionmanabig == 0:
		bigmanapotion.visible = false
	else: bigmanapotion.visible = true
	if InventoryLoad.potionluck == 0:
		luckpotion.visible = false
	else: luckpotion.visible = true
	if InventoryLoad.potioninvis == 0:
		inviselixir.visible = false
	else: inviselixir.visible = true
	if InventoryLoad.potionvenompurge == 0:
		venompurge.visible = false
	else: venompurge.visible = true
	if InventoryLoad.potionplagueward == 0:
		plaguewardpotion.visible = false
	else: plaguewardpotion.visible = true
	if InventoryLoad.potionblossom == 0:
		blossombrew.visible = false
	else: blossombrew.visible = true
	if InventoryLoad.potionbindingdecoc == 0:
		woundbindpotion.visible = false
	else: woundbindpotion.visible = true
	if InventoryLoad.potionregenhealth == 0:
		regenpotion.visible = false
	else: regenpotion.visible = true
	if InventoryLoad.potionhealthbig == 0:
		bighealth.visible = false
	else: bighealth.visible = true
	if InventoryLoad.potionhealthvial == 0:
		healthvial.visible = false
	else: healthvial.visible = true
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
	else : billberry.visible = true
	if InventoryLoad.plantain == 0:
		plantain.visible = false
	else: plantain.visible = true
	if InventoryLoad.honey == 0:
		honey.visible = false
	else: honey.visible = true
	if InventoryLoad.potionmana == 0:
		potionmana.visible = false
	else: potionmana.visible = true
	if InventoryLoad.rawmeat == 0:
		rawmeat.visible = false
	else: rawmeat.visible = true
	if InventoryLoad.bread == 0:
		bread.visible = false
	else: bread.visible = true

	if InventoryLoad.wine == 0:
		wine.visible = false
	else : wine.visible = true

	if InventoryLoad.cheapwine == 0:
		cheapwine.visible = false
	else : cheapwine.visible = true

	if InventoryLoad.finewine == 0:
		finewine.visible = false
	else: finewine.visible = true

	if InventoryLoad.potionhealth == 0:
		potionhealth.visible = false
	else : potionhealth.visible = true

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
