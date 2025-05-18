extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	_appearance()

func _appearance():
	var anim = randi() % 3
	match anim:
		0:
			$Sprite.texture = ResourceLoader.load("res://Levels/Level1/Sprites/Bookstack1.png")
		1:
			$Sprite.texture = ResourceLoader.load("res://Levels/Level1/Sprites/Bookstack2.png")
		2:
			$Sprite.texture = ResourceLoader.load("res://Levels/Level1/Sprites/Bookstack3.png")


func _on_HurtBox_area_entered(_area):
	$Timer.start()




func _on_Timer_timeout():
	$Sprite.visible = false
	$AnimationPlayer.play("Broken")
