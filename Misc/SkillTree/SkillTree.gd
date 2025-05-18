extends CanvasLayer


var ChoseSkill = false

var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")


func _ready():
	$Skills/Character/CharacterAnim.play("HoverOff")
	$Skills/DaggerShortSword/DaggerAnim.play("HoverOff")
	$Skills/SwordAxe/SwordAnim.play("HoverOff")
	$Skills/TwoHanded/TwoHandedAnim.play("HoverOff")
	$Skills/MagicAlchemy/MagicAnim.play("HoverOff")
	$Skills/MaceFlail/MaceAnim.play("HoverOff")
	$Skills/BowCrossbow/BowAnim.play("HoverOff")
	$Skills/Special/SpecialAnim.play("HoverOff")

func _physics_process(_delta):
	$Skills/SP/SkillPoints/Number.text = "%s" % [PGS.skillpoints]



	if PGS.active_skill == true:
		$Skills/Button/BtnOffOn.play("Ignore")
	else :
		$Skills/Button/BtnOffOn.play("Idle")



	if Input.is_action_just_pressed("Pause") or Input.is_action_just_pressed("CharacterMenu"):
		if PGS.skillstree == true:
			if ChoseSkill == true:
				if $Skills/Character/CharacterPanel.scale.x == 1.5 :
					$Skills/Character/CharacterAnim.play("Restore")
				elif $Skills/DaggerShortSword/DaggerPanel.scale.x == 1.5:
					$Skills/DaggerShortSword/DaggerAnim.play("Restore")
				elif $Skills/SwordAxe/SwordPanel.scale.x == 1.5:
					$Skills/SwordAxe/SwordAnim.play("Restore")
				elif $Skills/TwoHanded/TwoHandedPanel.scale.x == 1.5:
					$Skills/TwoHanded/TwoHandedAnim.play("Restore")
				elif $Skills/MagicAlchemy/MagicPanel.scale.x == 1.5:
					$Skills/MagicAlchemy/MagicAnim.play("Restore")
				elif $Skills/MaceFlail/MacePanel.scale.x == 1.5:
					$Skills/MaceFlail/MaceAnim.play("Restore")
				elif $Skills/BowCrossbow/BowPanel.scale.x == 1.5:
					$Skills/BowCrossbow/BowAnim.play("Restore")
				elif $Skills/Special/SpecialPanel.scale.x == 1.5:
					$Skills/Special/SpecialAnim.play("Restore")
				ChoseSkill = false








func _deactiv():
	$SkillTreeAnim.play("Deactivate")
	$Skills/Character/CharacterAnim.play("Idle")
	$Skills/DaggerShortSword/DaggerAnim.play("Idle")
	$Skills/SwordAxe/SwordAnim.play("Idle")
	$Skills/TwoHanded/TwoHandedAnim.play("Idle")
	$Skills/MagicAlchemy/MagicAnim.play("Idle")
	$Skills/MaceFlail/MaceAnim.play("Idle")
	$Skills/BowCrossbow/BowAnim.play("Idle")
	$Skills/Special/SpecialAnim.play("Idle")

#CHARACTER ---------------------------------------------------------------------------------------------------------------
func _on_Character_mouse_entered():
	$Skills/Character/CharacterAnim.play("HoverOn")
func _on_Character_mouse_exited():
	$Skills/Character/CharacterAnim.play("HoverOff")
func _on_Character_pressed():
	$Skills/Character/CharacterAnim.play("Clicked")
	ChoseSkill = true
#DAGGER ---------------------------------------------------------------------------------------------------------------
func _on_Dagger_mouse_entered():
	$Skills/DaggerShortSword/DaggerAnim.play("HoverOn")
func _on_Dagger_mouse_exited():
	$Skills/DaggerShortSword/DaggerAnim.play("HoverOff")
func _on_Dagger_pressed():
	$Skills/DaggerShortSword/DaggerAnim.play("Clicked")
	ChoseSkill = true

#SwORD ---------------------------------------------------------------------------------------------------------------
func _on_Sword_mouse_entered():
	$Skills/SwordAxe/SwordAnim.play("HoverOn")
func _on_Sword_mouse_exited():
	$Skills/SwordAxe/SwordAnim.play("HoverOff")
func _on_Sword_pressed():
	$Skills/SwordAxe/SwordAnim.play("Clicked")
	ChoseSkill = true
#TwOHANDED ---------------------------------------------------------------------------------------------------------------
func _on_TwoHanded_mouse_entered():
	$Skills/TwoHanded/TwoHandedAnim.play("HoverOn")
func _on_TwoHanded_mouse_exited():
	$Skills/TwoHanded/TwoHandedAnim.play("HoverOff")
func _on_TwoHanded_pressed():
	$Skills/TwoHanded/TwoHandedAnim.play("Clicked")
	ChoseSkill = true
#MAGIC ---------------------------------------------------------------------------------------------------------------
func _on_Magic_mouse_entered():
	$Skills/MagicAlchemy/MagicAnim.play("HoverOn")
func _on_Magic_mouse_exited():
	$Skills/MagicAlchemy/MagicAnim.play("HoverOff")
func _on_Magic_pressed():
	$Skills/MagicAlchemy/MagicAnim.play("Clicked")
	ChoseSkill = true
#MACE ---------------------------------------------------------------------------------------------------------------
func _on_Mace_mouse_entered():
	$Skills/MaceFlail/MaceAnim.play("HoverOn")
func _on_Mace_mouse_exited():
	$Skills/MaceFlail/MaceAnim.play("HoverOff")
func _on_Mace_pressed():
	$Skills/MaceFlail/MaceAnim.play("Clicked")
	ChoseSkill = true
#BOw ---------------------------------------------------------------------------------------------------------------
func _on_Bow_mouse_entered():
	$Skills/BowCrossbow/BowAnim.play("HoverOn")
func _on_Bow_mouse_exited():
	$Skills/BowCrossbow/BowAnim.play("HoverOff")
func _on_Bow_pressed():
	$Skills/BowCrossbow/BowAnim.play("Clicked")
	ChoseSkill = true
#SPECIAL ---------------------------------------------------------------------------------------------------------------
func _on_Special_mouse_entered():
	$Skills/Special/SpecialAnim.play("HoverOn")
func _on_Special_mouse_exited():
	$Skills/Special/SpecialAnim.play("HoverOff")
func _on_Special_pressed():
	$Skills/Special/SpecialAnim.play("Clicked")
	ChoseSkill = true







func _on_Button_mouse_entered():
	$Skills/Button/BtnAnim.play("Hover")
func _on_Button_mouse_exited():
	$Skills/Button/BtnAnim.play("Idle")
func _on_Button_pressed():
	$Skills/Button/BtnAnim.play("Click")

	if ChoseSkill == false:
		_deactiv()
		if PGS.skillstree == true:
			PGS.skillstree = false
			if PGS.charactermenu == false:
				get_tree().paused = false
	if ChoseSkill == true:
		if $Skills/Character/CharacterPanel.scale.x == 1.5:
			$Skills/Character/CharacterAnim.play("Restore")
		elif $Skills/DaggerShortSword/DaggerPanel.scale.x == 1.5:
			$Skills/DaggerShortSword/DaggerAnim.play("Restore")
		elif $Skills/SwordAxe/SwordPanel.scale.x == 1.5:
			$Skills/SwordAxe/SwordAnim.play("Restore")
		elif $Skills/TwoHanded/TwoHandedPanel.scale.x == 1.5:
			$Skills/TwoHanded/TwoHandedAnim.play("Restore")
		elif $Skills/MagicAlchemy/MagicPanel.scale.x == 1.5:
			$Skills/MagicAlchemy/MagicAnim.play("Restore")
		elif $Skills/MaceFlail/MacePanel.scale.x == 1.5:
			$Skills/MaceFlail/MaceAnim.play("Restore")
		elif $Skills/BowCrossbow/BowPanel.scale.x == 1.5:
			$Skills/BowCrossbow/BowAnim.play("Restore")
		elif $Skills/Special/SpecialPanel.scale.x == 1.5:
			$Skills/Special/SpecialAnim.play("Restore")
		ChoseSkill = false


func _reset():
	$Skills/Character/CharacterAnim.play("Reset")


