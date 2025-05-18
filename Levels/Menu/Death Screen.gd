extends CanvasLayer

var reticle_sword = preload("res://Misc/UI elements/Reticles/Dagger_reticle.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	_dead()


func _dead() :
	if PlayerStats.health <= 0:
		$AnimationPlayer.play("Fade In")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		Input.set_custom_mouse_cursor(reticle_sword)




func _on_Quit_to_Desktop_pressed():
	$Click.play()
	$Black/StartAnim.play("Quit")
	$QuitTimer.start()




func _on_QuitTimer_timeout():
	get_tree().quit()


func _on_Load_Game_mouse_entered():
	$Hover.play()
	$"Load Game/LoadAnim".play("Hover")

func _on_Load_Game_mouse_exited():
	$"Load Game/LoadAnim".play("Inactive")


func _on_Quit_to_Desktop_mouse_entered():
	$Hover.play()
	$"Quit to Desktop/QuitAnim".play("Hover")
func _on_Quit_to_Desktop_mouse_exited():
	$"Quit to Desktop/QuitAnim".play("Inactive")






func _on_Load_Game_pressed():

	PGS.TEMP = 0
	PGS.DREAD = 0
	PlayerStats.health = PlayerStats.max_health
	$Click.play()
	get_tree().reload_current_scene()
	$"../Hemwick".global_position.x = PGS.SpawnPosX
	$"../Hemwick".global_position.y = PGS.SpawnPosY
