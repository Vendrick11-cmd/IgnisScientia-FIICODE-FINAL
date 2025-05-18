extends Node


var lavender = false
var rosemary = false
var charcoal = false
var ginseng = false
var ginger = false
var nettle = false
var thistle = false
var yarrow = false
var comfrey = false
var valerian = false
var mugwort = false
var blue_lotus = false
var mandrake = false
var luckyclover = false
var honey = false
var plantain = false
var billberry = false
var garlic = false
var eyebright = false
var bonemeal = false
var bones = false
var bonemarrow = false


var Healing = [lavender, rosemary, nettle, honey, plantain]
var Recovery = [comfrey, yarrow, valerian, garlic]
var Poison = [mandrake, mugwort, blue_lotus]
var Stamina = [ginger, ginseng, thistle]
var Mana = [billberry, eyebright, luckyclover]
var Antidote = [charcoal]

func _physics_process(_delta):
	pass


func _on_Brew_mouse_exited():
	$"../CauldronUI/Brew/BtnAnim".play("Idle")
func _on_Brew_mouse_entered():
	$"../CauldronUI/Brew/BtnAnim".play("Hover")


func _on_Brew_focus_entered():
	$"../CauldronUI/Brew/BtnAnim".play("Hover")


func _on_Brew_pressed():

	$"../CauldronUI/Brew/BtnAnim".play("Click")
	_create()
	_resetingredients()



func _create():


	#TIRELESS BREW
	if ALC.ginger and ALC.nettle and ALC.ginseng and ALC.billberry and ALC.valerian and ALC.charcoal and ALC.mugwort and ALC.rosemary:
		InventoryLoad.potiontirelessbrew += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionTirelessBrew")

	#REJUVENATION POTION
	elif ALC.comfrey and ALC.yarrow and ALC.ginseng and ALC.valerian and ALC.rosemary and ALC.bonemarrow and ALC.mandrake:
		InventoryLoad.potionrejuv += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionRejuvenation")

	#POTENT STAMINA POTION
	elif ALC.ginger and ALC.nettle and ALC.billberry and ALC.thistle and ALC.mugwort and ALC.valerian and ALC.ginseng and ALC.honey:
		InventoryLoad.potionpotentstamina += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionStaminaBig")

	#LIFE POTION
	elif ALC.ginseng and ALC.rosemary and ALC.valerian and ALC.bonemarrow and ALC.ginger and ALC.yarrow and ALC.plantain:
		InventoryLoad.potionlife += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionLife")

	#PURIFY ELIXIR
	elif ALC.ginseng and ALC.charcoal and ALC.eyebright and ALC.mugwort and ALC.nettle and ALC.rosemary:
		InventoryLoad.purifelixir += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionPurifyElixir")

	#INVIS ELIXIR
	elif ALC.eyebright and ALC.mandrake and ALC.mugwort and ALC.thistle and ALC.valerian and ALC.ginseng:
		InventoryLoad.potioninvis += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionInvis")

	#BIGHEALTH POTION
	elif ALC.lavender and ALC.valerian and ALC.yarrow and ALC.plantain and ALC.nettle and ALC.honey :
		InventoryLoad.potionhealthbig += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionBigHealth")

	#STAMINA POTION
	elif ALC.ginger and ALC.nettle and ALC.ginseng and ALC.thistle and ALC.mugwort and ALC.honey:
		InventoryLoad.potionstamina += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionStamina")

	#BIG REGEN POTION
	elif ALC.ginseng and ALC.rosemary and ALC.billberry and ALC.charcoal and ALC.honey:
		InventoryLoad.potionregenbig += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionBigRegeneration")

	#BIG MANA POTION
	elif ALC.eyebright and ALC.valerian and ALC.ginseng and ALC.mugwort and ALC.rosemary:
		InventoryLoad.potionmanabig += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionManaBig")

	#DREAM POTION
	elif ALC.eyebright and ALC.mugwort and ALC.blue_lotus and ALC.valerian and ALC.mandrake:
		InventoryLoad.potiondreamwalker += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionDream")

	#ELIXIR OF UNDYING
	elif ALC.rosemary and ALC.blue_lotus and ALC.nettle and ALC.lavender and ALC.yarrow:
		InventoryLoad.potionundyingelixir += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionUndying")

	#VENOM PURGE ELIXIR
	elif ALC.charcoal and ALC.thistle and ALC.nettle and ALC.rosemary and ALC.garlic:
		InventoryLoad.potionvenompurge += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionVenomPurge")

	#HEALTHPOTION
	elif ALC.lavender and ALC.rosemary and ALC.ginseng and ALC.honey:
		InventoryLoad.potionhealth += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionHealth")

	#REGEN POTION
	elif ALC.lavender and ALC.yarrow and ALC.nettle and ALC.rosemary:
		InventoryLoad.potionregenhealth += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionRegeneration")

	#HUNTING INSTINCT TONIC
	elif ALC.ginger and ALC.rosemary and ALC.billberry and ALC.valerian:
		InventoryLoad.potionhunting += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionHunting")

	#LUCK POTION
	elif ALC.ginseng and ALC.rosemary and ALC.blue_lotus and ALC.luckyclover:
		InventoryLoad.potionluck += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionLuck")

	#PLAGUE WARD POTION
	elif ALC.charcoal and ALC.yarrow and ALC.rosemary and ALC.garlic:
		InventoryLoad.potionplagueward += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionPlagueWard")

	#MANA POTION ALTERNATIVE
	elif ALC.rosemary and ALC.ginseng and ALC.mandrake:
		InventoryLoad.potionmana += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionMana")

	#HEALTHVIAL
	elif ALC.lavender and ALC.rosemary and ALC.yarrow:
		InventoryLoad.potionhealthvial += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionHealthVial")

	#WOUND BINDING DECOCTION
	elif ALC.yarrow and ALC.comfrey and ALC.plantain:
		InventoryLoad.potionbindingdecoc += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionWoundBinding")

	#SIMPLE POISON
	elif ALC.mandrake and ALC.mugwort and ALC.bones:
		InventoryLoad.potionsimplepoison += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionSimplePoison")

	#VENOM VIAL
	elif ALC.mandrake and ALC.eyebright and ALC.charcoal:
		InventoryLoad.potionvenomvial += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionVenomVial")

	#BLEEDING THORN
	elif ALC.mandrake and ALC.blue_lotus and ALC.nettle:
		InventoryLoad.potionbleedthorn += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionBleedingThornPoison")

	#FIRE RESISTANCE POTION
	elif ALC.ginger and ALC.nettle and ALC.charcoal:
		InventoryLoad.potionfireres += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionFireRes")

	#AWARENESS POTION
	elif ALC.eyebright and ALC.mugwort and ALC.blue_lotus:
		InventoryLoad.potionawareness += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionAwareness")

	#MANA POTION
	elif ALC.eyebright and ALC.valerian and ALC.mugwort:
		InventoryLoad.potionmana += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionMana")

	#BLOSSOM POTION
	elif ALC.bonemeal and ALC.charcoal and ALC.bones:
		InventoryLoad.potionblossom += 1
		$"../../Sounds/BrewPotion".play()
		$"../../Sounds/BrewPotion".pitch_scale = rand_range(0.7, 1.3)
		$"../ConfirmPanel/PanelAnim".play("Active")
		$"../ConfirmPanel/DescAnim".play("PotionBlossom")

	#POTION CREATION FAILED


	elif ALC.lavender or ALC.rosemary or ALC.charcoal or ALC.ginseng or ALC.ginger or ALC.nettle or ALC.thistle or ALC.yarrow or ALC.comfrey or ALC.valerian or ALC.mugwort or ALC.blue_lotus or ALC.mandrake or ALC.luckyclover or ALC.honey or ALC.plantain or ALC.billberry or ALC.garlic or ALC.eyebright or ALC.bonemeal or ALC.bones or ALC.bonemarrow:
		$"../../Sounds/FailPotion".play()
		$"../../Sounds/FailPotion".pitch_scale = rand_range(0.8,1.2)
		$"../CauldronUI/FailedLabel/AnimationPlayer".play("BrewFailed")

	else:
		$"../../Sounds/Click".play()
		$"../../Sounds/Click".pitch_scale = rand_range(0.8,1.2)
		$"../CauldronUI/FailedLabel/AnimationPlayer".play("NoIngredients")





func _resetingredients():
	$"../Ingredients/Lavender".visible = false
	$"../Ingredients/Nettle".visible = false
	$"../Ingredients/Rosemary".visible = false
	$"../Ingredients/Comfrey".visible = false
	$"../Ingredients/Thistle".visible = false
	$"../Ingredients/Yarrow".visible = false
	$"../Ingredients/Ginger".visible = false
	$"../Ingredients/Ginseng".visible = false
	$"../Ingredients/Charcoal".visible = false
	$"../Ingredients/ValerianRoot".visible = false
	$"../Ingredients/Mugwort".visible = false
	$"../Ingredients/BlueLotus".visible = false
	$"../Ingredients/Mandrake".visible = false
	$"../Ingredients/Honey".visible = false
	$"../Ingredients/Plantain".visible = false
	$"../Ingredients/Billberry".visible = false
	$"../Ingredients/Garlic".visible = false
	$"../Ingredients/Eyebright".visible = false
	$"../Ingredients/BoneMeal".visible = false
	$"../Ingredients/LuckyClover".visible = false
	$"../Ingredients/BoneMarrow".visible = false
	$"../Ingredients/Bones".visible = false
	ALC.lavender = false
	ALC.rosemary = false
	ALC.charcoal = false
	ALC.ginseng = false
	ALC.ginger = false
	ALC.nettle = false
	ALC.thistle = false
	ALC.yarrow = false
	ALC.comfrey = false
	ALC.valerian = false
	ALC.mugwort = false
	ALC.blue_lotus = false
	ALC.mandrake = false
	ALC.luckyclover = false
	ALC.honey = false
	ALC.plantain = false
	ALC.billberry = false
	ALC.garlic = false
	ALC.eyebright = false
	ALC.bonemeal = false
	ALC.bones = false
	ALC.bonemarrow = false



