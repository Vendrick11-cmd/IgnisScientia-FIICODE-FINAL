extends CanvasLayer


var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	$Tree/TreeAnim.play("Inactive")


func _physics_process(_delta):
	_shortcuts()

	if Input.is_action_just_pressed("CharacterMenu") and PGS.charactermenu == false and $"../PauseMenu".visible == false and PGS.alchemy == false and PGS.in_dialogue == false:
		$Tree/TreeAnim.play("Active")
		get_tree().paused = true
		PGS.charactermenu = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)

	elif Input.is_action_just_pressed("Pause") or Input.is_action_just_pressed("CharacterMenu"):
		if PGS.charactermenu == true:
			if $Tree/SkillTree.ChoseSkill == false:
				get_tree().paused = false
				$Tree/TreeAnim.play("Inactive")
				PGS.charactermenu = false
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



			if PGS.inventory == true:
				$Tree/Inventory/Anim.play("Inactive")
				PGS.inventory = false

			elif PGS.skillstree == true:
				if $Tree/SkillTree.ChoseSkill == false:
					$Tree/SkillTree/SkillTreeAnim.play("Deactivate")
					PGS.skillstree = false




func _on_Map_mouse_entered():
	if !$Tree/MapCont/Map/ButtonAnim.current_animation == "Pressed":
		$Tree/MapCont/Map/ButtonAnim.play("Hover")
		$Sounds/CharacterMenuHover.play()
func _on_Map_mouse_exited():
	if !$Tree/MapCont/Map/ButtonAnim.current_animation == "Pressed":
		$Tree/MapCont/Map/ButtonAnim.play("UnHover")
func _on_Map_pressed():
	$Sounds/Click.play()
	$Tree/MapCont/Map/ButtonAnim.play("Pressed")

	if PGS.inventory == true:
		$Tree/Inventory/Anim.play("Inactive")
		PGS.inventory = false

	if PGS.skillstree == true:
		$Tree/SkillTree/SkillTreeAnim.play("Deactivate")
		PGS.skillstree = false


func _on_Inventory_mouse_entered():
	$Sounds/CharacterMenuHover.play()
	if !$Tree/InventoryCont/Inventory/ButtonAnim.current_animation == "Pressed":
		$Tree/InventoryCont/Inventory/ButtonAnim.play("Hover")
func _on_Inventory_mouse_exited():
	if !$Tree/InventoryCont/Inventory/ButtonAnim.current_animation == "Pressed":
		$Tree/InventoryCont/Inventory/ButtonAnim.play("UnHover")
func _on_Inventory_pressed():
	$Sounds/Click.play()


	if PGS.inventory == false and !$Tree/Inventory/Anim.current_animation == "Inactive":
		$Tree/InventoryCont/Inventory/ButtonAnim.play("Pressed")
		$Tree/Inventory/Anim.play("Active")
		PGS.inventory = true

	elif PGS.inventory == true and !$Tree/Inventory/Anim.current_animation == "Active":
		$Tree/InventoryCont/Inventory/ButtonAnim.play("Pressed")
		$Tree/Inventory/Anim.play("Inactive")
		PGS.inventory = false

	if PGS.skillstree == true:
		$Tree/SkillTree/SkillTreeAnim.play("Deactivate")
		PGS.skillstree = false


func _on_Equipment_mouse_entered():
	$Sounds/CharacterMenuHover.play()
	if !$Tree/EquipmentCont/Equipment/ButtonAnim.current_animation == "Pressed":
		$Tree/EquipmentCont/Equipment/ButtonAnim.play("Hover")
func _on_Equipment_mouse_exited():
	if !$Tree/EquipmentCont/Equipment/ButtonAnim.current_animation == "Pressed":
		$Tree/EquipmentCont/Equipment/ButtonAnim.play("UnHover")
func _on_Equipment_pressed():
	$Sounds/Click.play()
	$Tree/EquipmentCont/Equipment/ButtonAnim.play("Pressed")

	if PGS.inventory == true:
		$Tree/Inventory/Anim.play("Inactive")
		PGS.inventory = false

	if PGS.skillstree == true:
		$Tree/SkillTree/SkillTreeAnim.play("Deactivate")
		PGS.skillstree = false


func _on_SkillTree_mouse_entered():
	$Sounds/CharacterMenuHover.play()
	if !$Tree/SkillTreeCont/SkillTree/ButtonAnim.current_animation == "Pressed":
		$Tree/SkillTreeCont/SkillTree/ButtonAnim.play("Hover")
func _on_SkillTree_mouse_exited():
	if !$Tree/SkillTreeCont/SkillTree/ButtonAnim.current_animation == "Pressed":
		$Tree/SkillTreeCont/SkillTree/ButtonAnim.play("UnHover")
func _on_SkillTree_pressed():
	$Sounds/Click.play()
	if PGS.inventory == true:
		$Tree/Inventory/Anim.play("Inactive")
		PGS.inventory = false

	if PGS.skillstree == false and !$Tree/SkillTree/SkillTreeAnim.current_animation == "Deactivate":
		PGS.skillstree = true
		$Tree/SkillTreeCont/SkillTree/ButtonAnim.play("Pressed")
		$Tree/SkillTree/SkillTreeAnim.play("Active")

	elif PGS.skillstree == true and !$Tree/SkillTree/SkillTreeAnim.current_animation == "Active":
		PGS.skillstree = false
		$Tree/SkillTreeCont/SkillTree/ButtonAnim.play("Pressed")
		$Tree/SkillTree/SkillTreeAnim.play("Deactivate")



func _shortcuts():
	if Input.is_action_just_pressed("Inventory") and PGS.charactermenu == false and $"../PauseMenu".visible == false and PGS.alchemy == false and PGS.in_dialogue == false:
		$Tree/TreeAnim.play("Active")
		get_tree().paused = true
		PGS.charactermenu = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)

	elif Input.is_action_just_pressed("Pause") or Input.is_action_just_pressed("Inventory"):
		if PGS.charactermenu == true:
			if $Tree/SkillTree.ChoseSkill == false:
				get_tree().paused = false
				$Tree/TreeAnim.play("Inactive")
				PGS.charactermenu = false
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



			if PGS.inventory == true:
				$Tree/Inventory/Anim.play("Inactive")
				PGS.inventory = false

			elif PGS.skillstree == true:
				if $Tree/SkillTree.ChoseSkill == false:
					$Tree/SkillTree/SkillTreeAnim.play("Deactivate")
					PGS.skillstree = false

	if Input.is_action_just_pressed("Inventory"):
		if PGS.inventory == false and !$Tree/Inventory/Anim.current_animation == "Inactive":
			$Tree/InventoryCont/Inventory/ButtonAnim.play("Pressed")
			$Tree/Inventory/Anim.play("Active")
			PGS.inventory = true

		elif PGS.inventory == true and !$Tree/Inventory/Anim.current_animation == "Active":
			$Tree/InventoryCont/Inventory/ButtonAnim.play("Pressed")
			$Tree/Inventory/Anim.play("Inactive")
			PGS.inventory = false

		if PGS.skillstree == true:
			$Tree/SkillTree/SkillTreeAnim.play("Deactivate")
			PGS.skillstree = false

