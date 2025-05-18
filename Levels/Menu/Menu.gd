extends Node2D

var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")
#var begin = preload("res://Levels/Begin/LevelBegin.tscn")
#var nextlevel = preload("res://Levels/Level1/Level1.tscn")
#var hollow = preload("res://Levels/LevelHollowgrove/Level_Hollowgrove.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(reticle_sword)


func _reset():
	$"CanvasLayer/MainMenu/Start New Game/StartAnim".play("Inactive")
	$CanvasLayer/Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Inactive")
	$"CanvasLayer/MainMenu/Load Game/LoadAnim".play("Inactive")
	$CanvasLayer/MainMenu/Options/OptionsAnim.play("Inactive")
	$CanvasLayer/Sure/Panel/YesNo/No/NoButton/NoAnim.play("Inactive")
	$CanvasLayer/Back/BackAnim.play("Inactive")
	$CanvasLayer/BackLoad/BackAnim.play("Inactive")
	$"CanvasLayer/MainMenu/Quit to Desktop/QuitAnim".play("Inactive")







func _on_Options_pressed():
	$Click.play()
	_reset()
	$CanvasLayer/MainMenu.visible = false
	$CanvasLayer/OptionsMenu.visible = true
	$CanvasLayer/Back.visible = true
	$MenuAnimations.play("Options")


func _on_Back_pressed():
		$Click.play()
		_reset()
		$CanvasLayer/MainMenu.visible = true
		$CanvasLayer/OptionsMenu.visible = false
		$CanvasLayer/Back.visible = false
		$MenuAnimations.play("OptionsBack")
		$CanvasLayer/MainMenu/Options/OptionsDescription/DescAnim.play("Inactive")



func _on_Quit_to_Desktop_pressed():
	$Click.play()
	$CanvasLayer/SureAnim.play("VisibleQuit")



func _on_Start_New_Game_pressed():
	$Click.play()
	$CanvasLayer/SureAnim.play("Visible")


func _on_YesButton_pressed():
	$Click.play()
	if $CanvasLayer/SureAnim.current_animation == "Visible":
		get_tree().change_scene("res://Levels/TestLevel.tscn")

	if $CanvasLayer/SureAnim.current_animation == "VisibleQuit":
		get_tree().quit()


func _on_NoButton_pressed():
	$Click.play()
	_reset()
	$CanvasLayer/SureAnim.play("NotVisible")


func _on_Start_New_Game_mouse_entered():
	$Hover.play()
	$"CanvasLayer/MainMenu/Start New Game/StartDescription/DescAnim".play("Active")
	$"CanvasLayer/MainMenu/Start New Game/StartAnim".play("Hover")
func _on_Start_New_Game_mouse_exited():
	$Hover.play()
	$"CanvasLayer/MainMenu/Start New Game/StartDescription/DescAnim".play("Inactive")
	$"CanvasLayer/MainMenu/Start New Game/StartAnim".play("Inactive")

func _on_Start_New_Game_focus_entered():
	$Hover.play()
	$"CanvasLayer/MainMenu/Start New Game/StartDescription/DescAnim".play("Active")
	$"CanvasLayer/MainMenu/Start New Game/StartAnim".play("Hover")

func _on_Start_New_Game_focus_exited():

	$"CanvasLayer/MainMenu/Start New Game/StartDescription/DescAnim".play("Inactive")
	$"CanvasLayer/MainMenu/Start New Game/StartAnim".play("Inactive")


func _on_Load_Game_mouse_entered():
	$Hover.play()
	$"CanvasLayer/MainMenu/Load Game/LoadDescription/DescAnim".play("Active")
	if $"CanvasLayer/MainMenu/Load Game".disabled != true:
		$"CanvasLayer/MainMenu/Load Game/LoadAnim".play("Hover")
func _on_Load_Game_mouse_exited():

	$"CanvasLayer/MainMenu/Load Game/LoadAnim".play("Inactive")
	$"CanvasLayer/MainMenu/Load Game/LoadDescription/DescAnim".play("Inactive")


func _on_Options_mouse_entered():
	$Hover.play()
	$CanvasLayer/MainMenu/Options/OptionsDescription/DescAnim.play("Active")
	$CanvasLayer/MainMenu/Options/OptionsAnim.play("Hover")
func _on_Options_mouse_exited():

	$CanvasLayer/MainMenu/Options/OptionsAnim.play("Inactive")
	$CanvasLayer/MainMenu/Options/OptionsDescription/DescAnim.play("Inactive")

func _on_Quit_to_Desktop_mouse_entered():
	$Hover.play()
	$"CanvasLayer/MainMenu/Quit to Desktop/QuitDescription/DescAnim".play("Active")
	$"CanvasLayer/MainMenu/Quit to Desktop/QuitAnim".play("Hover")
func _on_Quit_to_Desktop_mouse_exited():

	$"CanvasLayer/MainMenu/Quit to Desktop/QuitAnim".play("Inactive")
	$"CanvasLayer/MainMenu/Quit to Desktop/QuitDescription/DescAnim".play("Inactive")


func _on_Back_mouse_entered():
	$Hover.play()
	$CanvasLayer/Back/BackAnim.play("Hover")
func _on_Back_mouse_exited():
	$CanvasLayer/Back/BackAnim.play("Inactive")


func _on_YesButton_mouse_entered():
	$Hover.play()
	$CanvasLayer/Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Hover")
func _on_YesButton_mouse_exited():
	$CanvasLayer/Sure/Panel/YesNo/Yes/YesButton/YesAnim.play("Inactive")


func _on_NoButton_mouse_entered():
	$Hover.play()
	$CanvasLayer/Sure/Panel/YesNo/No/NoButton/NoAnim.play("Hover")
func _on_NoButton_mouse_exited():
	$CanvasLayer/Sure/Panel/YesNo/No/NoButton/NoAnim.play("Inactive")


func _on_Load_Game_pressed():
	$Click.play()
	$MenuAnimations.play("LoadGame")


func _on_BackLoad_pressed():
	$Click.play()
	$MenuAnimations.play("LoadGameBack")
	_reset()
	$"CanvasLayer/MainMenu/Load Game/LoadDescription/DescAnim".play("Inactive")
func _on_BackLoad_mouse_entered():
	$Hover.play()
	$CanvasLayer/BackLoad/BackAnim.play("Hover")
func _on_BackLoad_mouse_exited():
	$CanvasLayer/BackLoad/BackAnim.play("Inactive")


