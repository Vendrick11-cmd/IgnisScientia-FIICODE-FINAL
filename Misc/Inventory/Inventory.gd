extends CanvasLayer



var rosemarytimer = false
var thistletimer = false
var gingertimer = false
var ginsengtimer = false
var charcoaltimer = false
var finewinetimer = false
var rawmeattimer = false
var bonemarrowtimer = false
var regenpotiontimer = false
var bigregenpotiontimer = false
var firerespotiontimer = false
var rejpotiontimer = false
var undyingpotiontimer = false
var staminapotiontimer = false
var bigstaminapotiontimer = false
var huntingpotiontimer = false
var luckpotiontimer = false
var invispotiontimer = false

# Called when the node enters the scene tree for the first time.
func _ready():

	$InventoryPanel/Tabs/TabAnim.play("Ingredients")

func _physics_process(_delta):
	if PGS.inventory == true:
		$InventoryPanel/Back/Button/BtnOffOn.play("Idle")
	else:
		$InventoryPanel/Back/Button/BtnOffOn.play("Ignore")




func _on_Button_pressed():
	$Sounds/Click.play()
	PGS.inventory = false
	$InventoryPanel/Back/Button/BtnAnim.play("Click")
	$Anim.play("Inactive")

func _on_Button_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/Back/Button/BtnAnim.play("Hover")

func _on_Button_mouse_exited():
	$InventoryPanel/Back/Button/BtnAnim.play("Idle")


func _on_TabIngredients_pressed():

	if $InventoryPanel/Tabs/TabAnim.current_animation != "Ingredients":
		$InventoryPanel/Tabs/TabAnim.play("Ingredients")
		$Sounds/IngredientsTab.play()
		$Sounds/IngredientsTab.pitch_scale = rand_range(0.8, 1.2)
func _on_TabPotions_pressed():

	if $InventoryPanel/Tabs/TabAnim.current_animation != "Potions":
		$InventoryPanel/Tabs/TabAnim.play("Potions")
		$Sounds/PotionsTab.play()
		$Sounds/PotionsTab.pitch_scale = rand_range(0.8,1.2)
func _on_TabQI_pressed():

	if $InventoryPanel/Tabs/TabAnim.current_animation != "QuestItems":
		$InventoryPanel/Tabs/TabAnim.play("QuestItems")
		$Sounds/QITab.play()
		$Sounds/QITab.pitch_scale = rand_range(0.8, 1.2)
func _on_TabVictuals_pressed():

	if $InventoryPanel/Tabs/TabAnim.current_animation != "Victuals":
		$InventoryPanel/Tabs/TabAnim.play("Victuals")
		$Sounds/VictualsTab.play()
		$Sounds/VictualsTab.pitch_scale = rand_range(0.8, 1.2)


func _on_Lavender_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Lavender")
func _on_Lavender_pressed():
	InventoryLoad.lavender -= 1
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	PlayerStats.health += 0.3
func _on_Lavender_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Lavender")

func _on_Nettle_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Nettle")
func _on_Nettle_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.nettle -= 1
	PlayerStats.health -= 1
func _on_Nettle_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Nettle")


func _on_Rosemary_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Rosemary")
func _on_Rosemary_pressed():
	PGS.consumed_buff = true
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.rosemary -=1
	if rosemarytimer == false:
		rosemarytimer = true
		PGS.stamina_factor += 0.015
	$Timers/RosemaryTimer.start()
func _on_Rosemary_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Rosemary")
func _on_RosemaryTimer_timeout():
	PGS.stamina_factor -= 0.015
	rosemarytimer = false

func _on_Comfrey_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.comfrey -= 1
	PlayerStats.health += 0.5
func _on_Comfrey_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Comfrey")
func _on_Comfrey_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Comfrey")

func _on_Thistle_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.thistle -= 1
	PlayerStats.health -= 3
	if thistletimer == false:
		thistletimer = true
		PGS.stamina_factor += 0.015
	$Timers/ThistleTimer.start()
func _on_ThistleTimer_timeout():
	thistletimer = false
	PGS.stamina_factor -= 0.015
func _on_Thistle_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Thistle")
func _on_Thistle_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Thistle")

func _on_Yarrow_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.yarrow -= 1
	PlayerStats.health += 1
func _on_Yarrow_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Yarrow")
func _on_Yarrow_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Yarrow")

func _on_Ginger_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.ginger -= 1
	if gingertimer == false:
		gingertimer = true
		PGS.stamina_factor += 0.03
	$Timers/GingerTimer.start()
func _on_Ginger_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Ginger")
func _on_Ginger_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Ginger")
func _on_GingerTimer_timeout():
	gingertimer = false
	PGS.stamina_factor -= 0.03

func _on_Ginseng_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.ginseng -= 1
	if ginsengtimer == false:
		ginsengtimer = true
		PGS.stamina_factor += 0.05
	$Timers/GinsengTimer.start()
func _on_Ginseng_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Ginseng")
func _on_Ginseng_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Ginseng")
func _on_GinsengTimer_timeout():
	ginsengtimer = false
	PGS.stamina_factor -= 0.05

func _on_Charcoal_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.charcoal -= 1
	if charcoaltimer == false:
		charcoaltimer = true
		PGS.stamina_factor -= 0.03
	$Timers/CharcoalTimer.start()
func _on_Charcoal_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Charcoal")
func _on_Charcoal_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Charcoal")
func _on_CharcoalTimer_timeout():
	charcoaltimer = false
	PGS.stamina_factor += 0.03

func _on_Valerian_Root_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.valerian -= 1
func _on_Valerian_Root_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Valerian")
func _on_Valerian_Root_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Valerian")

func _on_Mugwort_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.mugwort -= 1
	PlayerStats.mana += 1
func _on_Mugwort_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Mugwort")
func _on_Mugwort_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Mugwort")

func _on_Blue_Lotus_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.blue_lotus -= 1
	PlayerStats.mana += 1
func _on_Blue_Lotus_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("BlueLotus")
func _on_Blue_Lotus_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("BlueLotus")

func _on_Mandrake_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.mandrake -= 1
	PlayerStats.mana += 3
func _on_Mandrake_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Mandrake")
func _on_Mandrake_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Mandrake")


func _on_HealthPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionhealth -= 1
	if !CharmsInv.has_charm("Leech"):
		PlayerStats.health += 20
func _on_HealthPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionHealth")
func _on_HealthPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionHealth")

func _on_Bread_pressed():
	$Sounds/EatFood.play()
	$Sounds/EatFood.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.bread -= 1
	PlayerStats.health += 5
func _on_Bread_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicBread")
func _on_Bread_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicBread")

func _on_Wine_pressed():
	$Sounds/Drink.play()
	$Sounds/Drink.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.wine -= 1
	PlayerStats.health += 5
func _on_Wine_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicWine")
func _on_Wine_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicWine")

func _on_CheapWine_pressed():
	$Sounds/Drink.play()
	$Sounds/Drink.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.cheapwine -= 1
	PlayerStats.health += 2
func _on_CheapWine_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicCheapWine")
func _on_CheapWine_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicCheapWine")

func _on_FineWine_pressed():
	$Sounds/Drink.play()
	$Sounds/Drink.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.finewine -= 1
	PlayerStats.health += 10
	if finewinetimer == false:
		finewinetimer = true
		PlayerStats.max_stamina += 15
	$Timers/FinewineTimer.start()
func _on_FineWine_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicFineWine")
func _on_FineWine_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicFineWine")
func _on_FinewineTimer_timeout():
	finewinetimer = false
	PlayerStats.max_stamina -= 15

func _on_RawMeat_pressed():
	InventoryLoad.rawmeat -= 1
	$Sounds/EatMeat.play()
	$Sounds/EatMeat.pitch_scale = rand_range(0.8, 1.2)
	if rawmeattimer == false:
		rawmeattimer = true
		PGS.poison_factor += 0.003
	$Timers/RawmeatTimer.start()
func _on_RawMeat_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicRawMeat")
func _on_RawMeat_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("VicRawMeat")
func _on_RawmeatTimer_timeout():
	rawmeattimer = false
	PGS.poison_factor -= 0.003

func _on_ManaPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionmana -= 1
	PlayerStats.mana += 20
func _on_ManaPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionMana")
func _on_ManaPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionMana")

func _on_item_pressed():
	pass # Replace with function body.
func _on_item_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Item")
func _on_item_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Item")

func _on_Honey_pressed():
	$Sounds/EatLiquid.play()
	$Sounds/EatLiquid.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.honey -= 1
	PlayerStats.health += 3
func _on_Honey_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Honey")
func _on_Honey_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Honey")

func _on_Plantain_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.plantain -= 1
	PlayerStats.health += 0.1
func _on_Plantain_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Plantain")
func _on_Plantain_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Plantain")


func _on_Billberry_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.billberry -= 1
	PlayerStats.mana += 0.5
func _on_Billberry_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Billberry")
func _on_Billberry_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Billberry")


func _on_Garlic_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.garlic -= 1
func _on_Garlic_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Garlic")
func _on_Garlic_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Garlic")

func _on_Eyebright_pressed():
	$Sounds/EatPlant.play()
	$Sounds/EatPlant.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.eyebright -= 1
	PlayerStats.mana += 2
func _on_Eyebright_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Eyebright")
func _on_Eyebright_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Eyebright")

func _on_BoneMeal_pressed():
	$Sounds/EatFood.play()
	$Sounds/EatFood.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.bonemeal -= 1
func _on_BoneMeal_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("BoneMeal")
func _on_BoneMeal_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("BoneMeal")


func _on_Bones_pressed():
	$Sounds/EatFood.play()
	$Sounds/EatFood.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.bones -= 1
func _on_Bones_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Bones")
func _on_Bones_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("Bones")

func _on_BoneMarrow_pressed():
	$Sounds/EatFood.play()
	$Sounds/EatFood.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.bonemarrow -= 1
	PlayerStats.health += 1
	if bonemarrowtimer == false:
		bonemarrowtimer = true
		PGS.stamina_factor += 0.015
	$Timers/BonemarrowTimer.start()
func _on_BoneMarrow_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("BoneMarrow")
func _on_BoneMarrow_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("BoneMarrow")
func _on_BonemarrowTimer_timeout():
	bonemarrowtimer = false
	PGS.stamina_factor -= 0.015


func _on_LuckyClover_pressed():
	$Sounds/EatFood.play()
	$Sounds/EatFood.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.lucky_clover -= 1
func _on_LuckyClover_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("LuckyClover")
func _on_LuckyClover_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("LuckyClover")

func _on_HealthVial_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionhealthvial -= 1
	if !CharmsInv.has_charm("Leech"):
		PlayerStats.health += 10
func _on_HealthVial_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionHealthVial")
func _on_HealthVial_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionHealthVial")

func _on_BigHealthPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionhealthbig -= 1
	if !CharmsInv.has_charm("Leech"):
		PlayerStats.health += 40
func _on_BigHealthPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBigHealth")
func _on_BigHealthPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBigHealth")

func _on_RegenPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionregenhealth -= 1
	if !CharmsInv.has_charm("Leech"):
		if regenpotiontimer == false:
			regenpotiontimer = true
			PGS.heal_factor += 0.007
		$Timers/RegenpotionTimer.start()
func _on_RegenPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionRegeneration")
func _on_RegenPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionRegeneration")
func _on_RegenpotionTimer_timeout():
	regenpotiontimer = false
	PGS.heal_factor -= 0.007

func _on_WoundBindDecoc_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionbindingdecoc -= 1
	#CURES BLEEDING
func _on_WoundBindDecoc_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionWoundBinding")
func _on_WoundBindDecoc_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionWoundBinding")

func _on_LifePotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionlife -= 1
	if !CharmsInv.has_charm("Leech"):
		PGS.default_MAXHEALTH += 5
		CharmsInv.update_charm_effects()
func _on_LifePotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionLife")
func _on_LifePotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionLife")

func _on_BigRegenPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionregenbig -= 1
	if !CharmsInv.has_charm("Leech"):
		if bigregenpotiontimer == false:
			bigregenpotiontimer = true
			PGS.heal_factor += 0.01
		$Timers/BigregenpotionTimer.start()
func _on_BigRegenPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBigRegeneration")
func _on_BigRegenPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBigRegeneration")
func _on_BigregenpotionTimer_timeout():
	bigregenpotiontimer = false
	PGS.heal_factor -= 0.01

func _on_PurifElixir_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.purifelixir -= 1
	PGS.poison_factor = 0
	if !CharmsInv.has_charm("Leech"):
		PlayerStats.health += 15
func _on_PurifElixir_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionPurifyElixir")
func _on_PurifElixir_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionPurifyElixir")

func _on_FireResPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionfireres -= 1
	if firerespotiontimer == false:
		firerespotiontimer = true
		PGS.TEMP -= 0.025
	$Timers/FirerespotionTimer.start()
func _on_FireResPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionFireRes")
func _on_FireResPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionFireRes")
func _on_FirerespotionTimer_timeout():
	firerespotiontimer = false
	PGS.TEMP += 0.05

func _on_RejuvPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionrejuv -= 1
	if !CharmsInv.has_charm("Leech"):
		PlayerStats.health = PlayerStats.max_health
	if rejpotiontimer == false:
		rejpotiontimer = true
		PGS.TEMP -= 0.05
	$Timers/RejpotionTimer.start()
func _on_RejuvPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionRejuvenation")
func _on_RejuvPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionRejuvenation")
func _on_RejpotionTimer_timeout():
	rejpotiontimer = false
	PGS.TEMP += 0.05

func _on_UndyingElixir_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionundyingelixir -= 1
	if undyingpotiontimer == false:
		undyingpotiontimer = true
		PGS.undying = true
	$Timers/UndyingTimer.start()
func _on_UndyingElixir_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionUndying")
func _on_UndyingElixir_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionUndying")
func _on_UndyingTimer_timeout():
	undyingpotiontimer = false
	PGS.undying = false

func _on_SimplePoison_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionsimplepoison -= 1
func _on_SimplePoison_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionSimplePoison")
func _on_SimplePoison_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionSimplePoison")

func _on_VenomVial_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionvenomvial -= 1
func _on_VenomVial_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionVenomVial")
func _on_VenomVial_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionVenomVial")

func _on_BleedingThorn_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionbleedthorn -= 1
func _on_BleedingThorn_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBleedingThornPoison")
func _on_BleedingThorn_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBleedingThornPoison")

func _on_TirelessBrew_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potiontirelessbrew -= 1
	PlayerStats.max_stamina += 15
func _on_TirelessBrew_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionTirelessBrew")
func _on_TirelessBrew_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionTirelessBrew")

func _on_StaminaPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionstamina -= 1
	if staminapotiontimer == false:
		staminapotiontimer = true
		PGS.stamina_factor += 0.05
	$Timers/StaminapotionTimer.start()
func _on_StaminaPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionStamina")
func _on_StaminaPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionStamina")
func _on_StaminapotionTimer_timeout():
	staminapotiontimer = false
	PGS.stamina_factor -= 0.05

func _on_PotentStaminaPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionpotentstamina -= 1
	if bigstaminapotiontimer == false:
		bigstaminapotiontimer = true
		PGS.stamina_factor += 0.07
	$Timers/BigstaminapotionTimer.start()
func _on_PotentStaminaPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionStaminaBig")
func _on_PotentStaminaPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionStaminaBig")
func _on_BigstaminapotionTimer_timeout():
	bigstaminapotiontimer = false
	PGS.stamina_factor -= 0.07

func _on_HuntingPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionhunting -= 1
	if huntingpotiontimer == false:
		huntingpotiontimer = true
		PGS.MAXSPEED += 30
	$Timers/HuntingpotionTimer.start()
func _on_HuntingPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionHunting")
func _on_HuntingPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionHunting")
func _on_HuntingpotionTimer_timeout():
	huntingpotiontimer = false
	PGS.MAXSPEED -= 30

func _on_AwarenessBrew_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionawareness -= 1
func _on_AwarenessBrew_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionAwareness")
func _on_AwarenessBrew_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionAwareness")

func _on_DreamwalkerElixir_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potiondreamwalker -= 1
func _on_DreamwalkerElixir_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionDream")
func _on_DreamwalkerElixir_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionDream")

func _on_BigManaPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionmanabig -= 1
	PlayerStats.mana += 30
func _on_BigManaPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionManaBig")
func _on_BigManaPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionManaBig")

func _on_LuckPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionluck -= 1
	if luckpotiontimer == false:
		luckpotiontimer = true
		PGS.luckpotion = true
	$Timers/LuckpotionTimer.start()
func _on_LuckPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionLuck")
func _on_LuckPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionLuck")
func _on_LuckpotionTimer_timeout():
	luckpotiontimer = false
	PGS.luckpotion = false

func _on_InvisibilityElixir_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potioninvis -= 1
	if invispotiontimer == false:
		invispotiontimer = true
		PGS.invis = true
	$Timers/InvispotionTimer.start()
func _on_InvisibilityElixir_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionInvis")
func _on_InvisibilityElixir_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionInvis")
func _on_InvispotionTimer_timeout():
	invispotiontimer = false
	PGS.invis = false

func _on_VenomPurgeElixir_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionvenompurge -= 1
func _on_VenomPurgeElixir_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionVenomPurge")
func _on_VenomPurgeElixir_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionVenomPurge")

func _on_PlagueWardPotion_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionplagueward -= 1
func _on_PlagueWardPotion_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionPlagueWard")
func _on_PlagueWardPotion_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionPlagueWard")

func _on_BlossomBrew_pressed():
	$Sounds/DrinkPotion.play()
	$Sounds/DrinkPotion.pitch_scale = rand_range(0.8, 1.2)
	InventoryLoad.potionblossom -= 1
func _on_BlossomBrew_focus_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBlossom")
func _on_BlossomBrew_mouse_entered():
	$Sounds/Hover.play()
	$InventoryPanel/ItemDesc/DescAnim.play("PotionBlossom")

































