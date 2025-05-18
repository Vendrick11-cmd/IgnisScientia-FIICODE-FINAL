extends CanvasLayer

var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")

func _physics_process(_delta):
	if PGS.alchemy == true :
		$AlchemyPanel/Back/Button/BtnOffOn.play("Idle")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)
	else:
		$AlchemyPanel/Back/Button/BtnOffOn.play("Ignore")

func _visibility():
	pass


func _on_Button_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Back/Button/BtnAnim.play("Click")
	$Anim.play("Inactive")
	PGS.alchemy = false

func _on_Button_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/Back/Button/BtnAnim.play("Hover")

func _on_Button_mouse_exited():
	$AlchemyPanel/Back/Button/BtnAnim.play("Idle")


func _on_TabIngredients_pressed():

	if $AlchemyPanel/Tabs/TabAnim.current_animation != "Ingredients":
		$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
		$Sounds/IngredientsTab.play()
		$Sounds/IngredientsTab.pitch_scale = rand_range(0.8, 1.2)



func _on_TabPotionRecipes_pressed():

	if $AlchemyPanel/Tabs/TabAnim.current_animation != "Potions":
		$AlchemyPanel/Tabs/TabAnim.play("Potions")
		$Sounds/PotionsTab.play()
		$Sounds/PotionsTab.pitch_scale = rand_range(0.8,1.2)
		$AlchemyPanel/Show/TabAnim.play("Recipes")

func _on_TabPoisons_pressed():

	if $AlchemyPanel/Tabs/TabAnim.current_animation != "Poisons":
		$AlchemyPanel/Tabs/TabAnim.play("Poisons")
		$Sounds/PoisonsTab.play()
		$Sounds/PoisonsTab.pitch_scale = rand_range(0.8, 1.2)
		$AlchemyPanel/Show/TabAnim.play("Recipes")

func _on_TabAntidotes_pressed():

	if $AlchemyPanel/Tabs/TabAnim.current_animation != "Antidotes":
		$AlchemyPanel/Tabs/TabAnim.play("Antidotes")
		$Sounds/AntidotesTab.play()
		$Sounds/AntidotesTab.pitch_scale = rand_range(0.8, 1.2)
		$AlchemyPanel/Show/TabAnim.play("Recipes")

func _on_Lavender_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Lavender")
func _on_Lavender_pressed():
	if $AlchemyPanel/Ingredients/Lavender.visible == true:

		ALC.lavender = false
		InventoryLoad.lavender += 1
		$AlchemyPanel/Ingredients/Lavender.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Lavender,22)
		ALC.lavender = true
		$AlchemyPanel/Ingredients/Lavender.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.lavender -= 1
func _on_Lavender_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Lavender")

func _on_Nettle_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Nettle")
func _on_Nettle_pressed():
	if $AlchemyPanel/Ingredients/Nettle.visible == true:
		ALC.nettle = false
		InventoryLoad.nettle += 1
		$AlchemyPanel/Ingredients/Nettle.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Nettle,22)
		ALC.nettle = true
		$AlchemyPanel/Ingredients/Nettle.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.nettle -= 1
func _on_Nettle_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Nettle")


func _on_Rosemary_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Rosemary")
func _on_Rosemary_pressed():
	if $AlchemyPanel/Ingredients/Rosemary.visible == true:
		ALC.rosemary = false
		InventoryLoad.rosemary += 1
		$AlchemyPanel/Ingredients/Rosemary.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Rosemary,22)
		ALC.rosemary = true
		$AlchemyPanel/Ingredients/Rosemary.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.rosemary -= 1
func _on_Rosemary_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Rosemary")


func _on_Comfrey_pressed():
	if $AlchemyPanel/Ingredients/Comfrey.visible == true:
		ALC.comfrey = false
		InventoryLoad.comfrey += 1
		$AlchemyPanel/Ingredients/Comfrey.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Comfrey,22)
		ALC.comfrey = true
		$AlchemyPanel/Ingredients/Comfrey.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.comfrey -= 1
func _on_Comfrey_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Comfrey")
func _on_Comfrey_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Comfrey")

func _on_Thistle_pressed():
	if $AlchemyPanel/Ingredients/Thistle.visible == true:
		ALC.thistle = false
		InventoryLoad.thistle += 1
		$AlchemyPanel/Ingredients/Thistle.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Thistle,22)
		ALC.thistle = true
		$AlchemyPanel/Ingredients/Thistle.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.thistle -= 1
func _on_Thistle_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Thistle")
func _on_Thistle_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Thistle")
func _on_Yarrow_pressed():
	if $AlchemyPanel/Ingredients/Yarrow.visible == true:
		ALC.yarrow = false
		InventoryLoad.yarrow += 1
		$AlchemyPanel/Ingredients/Yarrow.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Yarrow,22)
		ALC.yarrow = true
		$AlchemyPanel/Ingredients/Yarrow.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.yarrow -= 1
func _on_Yarrow_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Yarrow")
func _on_Yarrow_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Yarrow")

func _on_Ginger_pressed():
	if $AlchemyPanel/Ingredients/Ginger.visible == true:
		ALC.ginger = false
		InventoryLoad.ginger += 1
		$AlchemyPanel/Ingredients/Ginger.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Ginger,22)
		ALC.ginger = true
		$AlchemyPanel/Ingredients/Ginger.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.ginger -= 1
func _on_Ginger_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Ginger")
func _on_Ginger_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Ginger")

func _on_Ginseng_pressed():
	if $AlchemyPanel/Ingredients/Ginseng.visible == true:
		ALC.ginseng = false
		InventoryLoad.ginseng += 1
		$AlchemyPanel/Ingredients/Ginseng.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Ginseng,22)
		ALC.ginseng = true
		$AlchemyPanel/Ingredients/Ginseng.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.ginseng -= 1
func _on_Ginseng_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Ginseng")
func _on_Ginseng_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Ginseng")

func _on_Charcoal_pressed():
	if $AlchemyPanel/Ingredients/Charcoal.visible == true:
		ALC.charcoal = false
		InventoryLoad.charcoal += 1
		$AlchemyPanel/Ingredients/Charcoal.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Charcoal,22)
		ALC.charcoal = true
		$AlchemyPanel/Ingredients/Charcoal.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.charcoal -= 1
func _on_Charcoal_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Charcoal")
func _on_Charcoal_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Charcoal")

func _on_Valerian_Root_pressed():
	if $AlchemyPanel/Ingredients/ValerianRoot.visible == true:
		ALC.valerian = false
		InventoryLoad.valerian += 1
		$AlchemyPanel/Ingredients/ValerianRoot.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/ValerianRoot,22)
		ALC.valerian = true
		$AlchemyPanel/Ingredients/ValerianRoot.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.valerian -= 1
func _on_Valerian_Root_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Valerian")
func _on_Valerian_Root_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Valerian")

func _on_Mugwort_pressed():
	if $AlchemyPanel/Ingredients/Mugwort.visible == true:
		ALC.mugwort = false
		InventoryLoad.mugwort += 1
		$AlchemyPanel/Ingredients/Mugwort.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Mugwort,22)
		ALC.mugwort = true
		$AlchemyPanel/Ingredients/Mugwort.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.mugwort -= 1
func _on_Mugwort_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Mugwort")
func _on_Mugwort_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Mugwort")

func _on_Blue_Lotus_pressed():
	if $AlchemyPanel/Ingredients/BlueLotus.visible == true:
		ALC.blue_lotus = false
		InventoryLoad.nettle += 1
		$AlchemyPanel/Ingredients/BlueLotus.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/BlueLotus,22)
		ALC.blue_lotus = true
		$AlchemyPanel/Ingredients/BlueLotus.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.nettle -= 1
func _on_Blue_Lotus_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("BlueLotus")
func _on_Blue_Lotus_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("BlueLotus")

func _on_Mandrake_pressed():
	if $AlchemyPanel/Ingredients/Mandrake.visible == true:
		ALC.mandrake = false
		InventoryLoad.mandrake += 1
		$AlchemyPanel/Ingredients/Mandrake.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Mandrake,22)
		ALC.mandrake = true
		$AlchemyPanel/Ingredients/Mandrake.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.mandrake -= 1
func _on_Mandrake_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Mandrake")
func _on_Mandrake_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Mandrake")


func _on_HealthPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")

func _on_HealthPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionHealth")
func _on_HealthPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionHealth")

func _on_Bread_pressed():
	$Sounds/AddIngredient.play()
	$Sounds/AddIngredient.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.bread -= 1
	PlayerStats.health += 5
func _on_Bread_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicBread")
func _on_Bread_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicBread")

func _on_Wine_pressed():
	$Sounds/Drink.play()
	$Sounds/Drink.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.wine -= 1
func _on_Wine_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicWine")
func _on_Wine_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicWine")

func _on_CheapWine_pressed():
	$Sounds/Drink.play()
	$Sounds/Drink.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.cheapwine -= 1
func _on_CheapWine_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicCheapWine")
func _on_CheapWine_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicCheapWine")

func _on_FineWine_pressed():
	$Sounds/Drink.play()
	$Sounds/Drink.pitch_scale = rand_range(0.8,1.2)
	InventoryLoad.finewine -= 1
func _on_FineWine_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicFineWine")
func _on_FineWine_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicFineWine")

func _on_RawMeat_pressed():
	InventoryLoad.rawmeat -= 1
	$Sounds/EatMeat.play()
	$Sounds/EatMeat.pitch_scale = rand_range(0.8, 1.2)
func _on_RawMeat_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicRawMeat")
func _on_RawMeat_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("VicRawMeat")


func _on_ManaPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_ManaPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionMana")
func _on_ManaPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionMana")

func _on_Honey_pressed():
	if $AlchemyPanel/Ingredients/Honey.visible == true:
		ALC.honey = false
		InventoryLoad.honey += 1
		$AlchemyPanel/Ingredients/Honey.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Honey,22)
		ALC.honey = true
		$AlchemyPanel/Ingredients/Honey.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.honey -= 1

func _on_Honey_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Honey")
func _on_Honey_mouse_entered():
	$AlchemyPanel/ItemDesc/DescAnim.play("Honey")

func _on_Plantain_pressed():
	if $AlchemyPanel/Ingredients/Plantain.visible == true:
		ALC.plantain = false
		InventoryLoad.plantain += 1
		$AlchemyPanel/Ingredients/Plantain.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Plantain,22)
		ALC.plantain = true
		$AlchemyPanel/Ingredients/Plantain.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.plantain -= 1
func _on_Plantain_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Plantain")
func _on_Plantain_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Plantain")

func _on_Billberry_pressed():
	if $AlchemyPanel/Ingredients/Billberry.visible == true:
		ALC.billberry = false
		InventoryLoad.billberry += 1
		$AlchemyPanel/Ingredients/Billberry.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Billberry,22)
		ALC.billberry = true
		$AlchemyPanel/Ingredients/Billberry.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.billberry -= 1
func _on_Billberry_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Billberry")
func _on_Billberry_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Billberry")

func _on_Garlic_pressed():
	if $AlchemyPanel/Ingredients/Garlic.visible == true:
		ALC.garlic = false
		InventoryLoad.garlic += 1
		$AlchemyPanel/Ingredients/Garlic.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Garlic,22)
		ALC.garlic = true
		$AlchemyPanel/Ingredients/Garlic.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.garlic -= 1
func _on_Garlic_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Garlic")
func _on_Garlic_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Garlic")

func _on_Eyebright_pressed():
	if $AlchemyPanel/Ingredients/Eyebright.visible == true:
		ALC.eyebright = false
		InventoryLoad.eyebright += 1
		$AlchemyPanel/Ingredients/Eyebright.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Eyebright,22)
		ALC.eyebright = true
		$AlchemyPanel/Ingredients/Eyebright.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.eyebright -= 1
func _on_Eyebright_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Eyebright")
func _on_Eyebright_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Eyebright")

func _on_BoneMeal_pressed():
	if $AlchemyPanel/Ingredients/BoneMeal.visible == true:
		ALC.bonemeal = false
		InventoryLoad.bonemeal += 1
		$AlchemyPanel/Ingredients/BoneMeal.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/BoneMeal,22)
		ALC.bonemeal = true
		$AlchemyPanel/Ingredients/BoneMeal.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.bonemeal -= 1
func _on_BoneMeal_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("BoneMeal")
func _on_BoneMeal_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("BoneMeal")

func _on_Bones_pressed():
	if $AlchemyPanel/Ingredients/Bones.visible == true:
		ALC.bones = false
		InventoryLoad.bones += 1
		$AlchemyPanel/Ingredients/Bones.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/Bones,22)
		ALC.bones = true
		$AlchemyPanel/Ingredients/Bones.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.bones -= 1
func _on_Bones_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Bones")
func _on_Bones_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("Bones")

func _on_BoneMarrow_pressed():
	if $AlchemyPanel/Ingredients/BoneMarrow.visible == true:
		ALC.bonemarrow= false
		InventoryLoad.bonemarrow += 1
		$AlchemyPanel/Ingredients/BoneMarrow.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/BoneMarrow,22)
		ALC.bonemarrow= true
		$AlchemyPanel/Ingredients/BoneMarrow.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.bonemarrow -= 1
func _on_BoneMarrow_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("BoneMarrow")
func _on_BoneMarrow_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("BoneMarrow")

func _on_LuckyClover_pressed():
	if $AlchemyPanel/Ingredients/LuckyClover.visible == true:
		ALC.luckyclover = false
		InventoryLoad.lucky_clover += 1
		$AlchemyPanel/Ingredients/LuckyClover.visible = false
		$Sounds/RemoveIngredient.play()
		$Sounds/RemoveIngredient.pitch_scale = rand_range(0.8, 1.2)
	else:
		$AlchemyPanel/Ingredients.move_child($AlchemyPanel/Ingredients/LuckyClover,22)
		ALC.luckyclover = true
		$AlchemyPanel/Ingredients/LuckyClover.visible = true
		$Sounds/AddIngredient.play()
		$Sounds/AddIngredient.pitch_scale = rand_range(0.8, 1.2)
		InventoryLoad.lucky_clover -= 1
func _on_LuckyClover_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("LuckyClover")
func _on_LuckyClover_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/ItemDesc/DescAnim.play("LuckyClover")

func _on_ManaPotionAlt_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionManaAlt")
func _on_ManaPotionAlt_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionManaAlt")

func _on_HealthVial_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionHealthVial")
func _on_HealthVial_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionHealthVial")

func _on_BigHealthPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBigHealth")
func _on_BigHealthPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBigHealth")

func _on_RegenPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionRegeneration")
func _on_RegenPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionRegeneration")

func _on_WoundBindDecoc_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionWoundBinding")
func _on_WoundBindDecoc_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionWoundBinding")

func _on_LifePotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionLife")
func _on_LifePotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionLife")

func _on_BigRegenPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBigRegeneration")
func _on_BigRegenPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBigRegeneration")

func _on_PurifElixir_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionPurifyElixir")
func _on_PurifElixir_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionPurifyElixir")

func _on_FireResPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionFireRes")

func _on_FireResPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionFireRes")

func _on_RejuvPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionRejuvenation")
func _on_RejuvPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionRejuvenation")

func _on_UndyingElixir_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionUndying")
func _on_UndyingElixir_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionUndying")

func _on_TirelessBrew_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionTirelessBrew")
func _on_TirelessBrew_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionTirelessBrew")

func _on_StaminaPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionStamina")
func _on_StaminaPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionStamina")

func _on_PotentStaminaPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionStaminaBig")
func _on_PotentStaminaPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionStaminaBig")

func _on_HuntingPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionHunting")
func _on_HuntingPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionHunting")

func _on_AwarenessBrew_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionAwareness")
func _on_AwarenessBrew_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionAwareness")

func _on_DreamwalkerElixir_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionDream")
func _on_DreamwalkerElixir_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionDream")

func _on_BigManaPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionManaBig")
func _on_BigManaPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionManaBig")

func _on_LuckPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionLuck")
func _on_LuckPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionLuck")

func _on_InvisibilityElixir_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionInvis")
func _on_InvisibilityElixir_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionInvis")

func _on_BlossomBrew_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBlossom")
func _on_BlossomBrew_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBlossom")

func _on_SimplePoison_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionSimplePoison")
func _on_SimplePoison_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionSimplePoison")

func _on_VenomVial_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionVenomVial")
func _on_VenomVial_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionVenomVial")

func _on_BleedingThorn_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBleedingThornPoison")
func _on_BleedingThorn_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionBleedingThornPoison")

func _on_VenomPurgeElixir_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionVenomPurge")
func _on_VenomPurgeElixir_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionVenomPurge")

func _on_PlagueWardPotion_focus_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionPlagueWard")
func _on_PlagueWardPotion_mouse_entered():
	$Sounds/Hover.play()
	$AlchemyPanel/PotionDesc/DescAnim.play("PotionPlagueWard")

func _on_TabDescription_pressed():
	$Sounds/DescriptionTab.play()
	$AlchemyPanel/Show/TabAnim.play("Description")
func _on_TabRecipes_pressed():
	$Sounds/RecipesTab.play()
	$AlchemyPanel/Show/TabAnim.play("Recipes")


func _on_ManaPotionAlt_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_HealthVial_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_BigHealthPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_RegenPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_WoundBindDecoc_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_LifePotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_BigRegenPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_PurifElixir_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_FireResPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_RejuvPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_UndyingElixir_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_TirelessBrew_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_StaminaPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_PotentStaminaPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_HuntingPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_AwarenessBrew_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_DreamwalkerElixir_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_BigManaPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_LuckPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_InvisibilityElixir_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_BlossomBrew_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")

func _on_SimplePoison_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_VenomVial_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_BleedingThorn_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")

func _on_VenomPurgeElixir_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
func _on_PlagueWardPotion_pressed():
	$Sounds/Click.play()
	$AlchemyPanel/Tabs/TabAnim.play("Ingredients")
