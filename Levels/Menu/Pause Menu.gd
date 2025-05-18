extends CanvasLayer

var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(_delta):
	_pause()

func _pause() :
	if Input.is_action_just_pressed("Pause") and get_tree().paused == false and PGS.skillstree == false and PGS.charactermenu == false and PGS.inventory == false and $"../CharacterMenu".visible == false:
		$AnimationPlayer.play("Fade In")
		$SettingsMenu.visible = false
		get_tree().paused = true
		self.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)


	elif Input.is_action_just_pressed("Pause") and get_tree().paused == true and PGS.skillstree == false and PGS.charactermenu == false and PGS.inventory == false:
		_reset()
		$AnimationPlayer.play("Fade Out")
		if $SettingsMenu.visible == true :
			$SettingsAnim.play("Fade Out")
		get_tree().paused = false
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



func _animation_finished() :
	pass
	#GlobalSettings.toggle_bloom(true)

func _reset():
	$MainMenu/Resume/StartAnim.play("Inactive")
	$"MainMenu/Load Game/StartAnim".play("Inactive")
	$MainMenu/Options/StartAnim.play("Inactive")
	$"MainMenu/Quit to Desktop/StartAnim".play("Inactive")
	$Back/BackAnim.play("Inactive")
	$Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Inactive")
	$Sure/Panel/YesNo/No/NoButton/NoAnim.play("Inactive")
	$BackLoad/BackAnim.play("Inactive")
	$Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Inactive")
	$Sure/Panel/YesNo/No/NoButton/NoAnim.play("Inactive")






func _on_Resume_pressed():
	_reset()
	get_tree().paused = false
	$AnimationPlayer.play("Fade Out")
	if $SettingsMenu.visible == true :
		$SettingsAnim.play("Fade Out")


func _on_Quit_to_Desktop_pressed():
	$SureAnim.play("VisibleQuit")


func _on_Options_pressed():
	_reset()
	if $SettingsMenu.visible == false :
		$SettingsAnim.play("Fade In")
	elif $SettingsMenu.visible == true :
		$SettingsAnim.play("Fade Out")


func _on_Resume_mouse_entered():
	$MainMenu/Resume/StartAnim.play("Hover")
	$MainMenu/Resume/StartDescription/DescAnim.play("Active")
func _on_Resume_mouse_exited():
	$MainMenu/Resume/StartDescription/DescAnim.play("Inactive")
	$MainMenu/Resume/StartAnim.play("Inactive")


func _on_Load_Last_Saved_Game_mouse_entered():
	$"MainMenu/Load Game/StartAnim".play("Hover")
	$"MainMenu/Load Game/StartDescription/DescAnim".play("Active")
func _on_Load_Last_Saved_Game_mouse_exited():
	$"MainMenu/Load Game/StartDescription/DescAnim".play("Inactive")
	$"MainMenu/Load Game/StartAnim".play("Inactive")

func _on_Load_Game_pressed():
	$AnimationPlayer.play("LoadGame")

func _on_Options_mouse_entered():
	$MainMenu/Options/StartAnim.play("Hover")
	$MainMenu/Options/StartDescription/DescAnim.play("Active")
func _on_Options_mouse_exited():
	$MainMenu/Options/StartAnim.play("Inactive")
	$MainMenu/Options/StartDescription/DescAnim.play("Inactive")


func _on_Quit_to_Desktop_mouse_entered():
	$"MainMenu/Quit to Desktop/StartAnim".play("Hover")
	$"MainMenu/Quit to Desktop/StartDescription/DescAnim".play("Active")
func _on_Quit_to_Desktop_mouse_exited():
	$"MainMenu/Quit to Desktop/StartDescription/DescAnim".play("Inactive")
	$"MainMenu/Quit to Desktop/StartAnim".play("Inactive")


func _on_Back_pressed():
	_reset()
	$SettingsAnim.play("Fade Out")


func _on_Back_mouse_entered():
	$Back/BackAnim.play("Hover")
func _on_Back_mouse_exited():
	$Back/BackAnim.play("Inactive")


func _on_YesButton_pressed():
	get_tree().quit()


func _on_YesButton_mouse_entered():
	$Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Hover")
func _on_YesButton_mouse_exited():
	$Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Inactive")


func _on_NoButton_pressed():
	_reset()
	$SureAnim.play("NotVisible")


func _on_NoButton_mouse_entered():
	$Sure/Panel/YesNo/No/NoButton/NoAnim.play("Hover")
func _on_NoButton_mouse_exited():
	$Sure/Panel/YesNo/No/NoButton/NoAnim.play("Inactive")




func _on_BackLoad_pressed():
	$AnimationPlayer.play_backwards("LoadGame")
	_reset()
	$"MainMenu/Load Game/StartDescription/DescAnim".play("Inactive")
func _on_BackLoad_mouse_entered():
	$BackLoad/BackAnim.play("Hover")
func _on_BackLoad_mouse_exited():
	$BackLoad/BackAnim.play("Inactive")
