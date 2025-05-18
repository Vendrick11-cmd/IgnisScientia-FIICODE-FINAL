extends TextureRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ok_pressed():
	$PanelAnim.play("Deactivate")
	$"../../Sounds/Click".play()

func _on_Ok_focus_entered():
	$Butt/Ok/BtnAnim.play("Hover")
	$"../../Sounds/Hover".play()

func _on_Ok_mouse_entered():
	$Butt/Ok/BtnAnim.play("Hover")
	$"../../Sounds/Hover".play()

func _on_Ok_mouse_exited():
	$Butt/Ok/BtnAnim.play("Idle")
