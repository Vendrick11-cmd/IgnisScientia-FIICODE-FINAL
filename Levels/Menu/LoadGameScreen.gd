extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	pass




func _on_ChapterI_mouse_entered():
	$Hover.play()
	$Load/Saves/ChapterIEerie/ChapterI/Anim.play("Hover")
	$Load/Saves/ChapterIEerie/AreaBrief/AnimationPlayer.play("Active")
func _on_ChapterI_mouse_exited():
	$Load/Saves/ChapterIEerie/ChapterI/Anim.play_backwards("Inactive")
	$Load/Saves/ChapterIEerie/AreaBrief/AnimationPlayer.play_backwards("Active")
func _on_ChapterI_pressed():
	$Click.play()
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")


func _on_ChapterII_pressed():
	$Click.play()
	pass
func _on_ChapterII_mouse_entered():
	$Hover.play()
	$Load/Saves/Inn/ChapterII/Anim.play("Hover")
	$Load/Saves/Inn/AreaBrief/AnimationPlayer.play("Active")
func _on_ChapterII_mouse_exited():
	$Hover.play()
	$Load/Saves/Inn/ChapterII/Anim.play("Inactive")
	$Load/Saves/Inn/AreaBrief/AnimationPlayer.play_backwards("Active")


func _on_ChapterIII_pressed():
	$Click.play()
	pass # Replace with function body.
func _on_ChapterIII_mouse_entered():
	$Hover.play()
	$Load/Saves/ChapterIIIDungeon/ChapterIII/Anim.play("Hover")
	$Load/Saves/ChapterIIIDungeon/AreaBrief/AnimationPlayer.play("Active")
func _on_ChapterIII_mouse_exited():
	$Hover.play()
	$Load/Saves/ChapterIIIDungeon/ChapterIII/Anim.play("Inactive")
	$Load/Saves/ChapterIIIDungeon/AreaBrief/AnimationPlayer.play_backwards("Active")
