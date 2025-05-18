extends CanvasLayer

export(String, FILE) var level

onready var settings_menu = $SettingsMenu
onready var start_btn = $MainMenu/StartGameBtn

func _ready():
	$Black/StartAnim.play("Start")
	$WorldEnvironment._on_bloom_toggled(false)
	
func _physics_process(delta):
	if $SettingsMenu.visible == true :
		if Input.is_action_just_pressed("Pause") :
			$MainMenuAnim.play("Finish")
			$Timer.start()

func _on_StartGameBtn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
	$WorldEnvironment._on_bloom_toggled(true)


func _on_SettingsBtn_pressed():
	settings_menu.visible = true
	$MainMenuAnim.play("Start")
	$Back.visible = true
	
	



func _on_ExitBtn_pressed():
	$QuitTimer.start()
	$Black/StartAnim.play("Quit")


func _on_Button_pressed():
	$MainMenuAnim.play("Finish")
	$Timer.start()
	


func _on_Timer_timeout():
	settings_menu.visible = false
	$Back.visible = false


func _on_QuitTimer_timeout():
	get_tree().quit()
