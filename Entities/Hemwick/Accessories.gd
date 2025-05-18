extends Node2D


#HATS
var none = preload("res://Entities/Hemwick/Accessories/Head/None.png")
var leaflantern = preload("res://Entities/Hemwick/Accessories/Head/LeafLantern.png")
var hornedhelmet = preload("res://Entities/Hemwick/Accessories/Head/HornedHelmet.png")
var oldhat = preload("res://Entities/Hemwick/Accessories/Head/OldHat.png")
var oldhat2 = preload("res://Entities/Hemwick/Accessories/Head/OldHat2.png")
var austrianpainter = preload("res://Entities/Hemwick/Accessories/Head/AustrianPainter.png")
var monocle = preload("res://Entities/Hemwick/Accessories/Head/Monocle.png")
var tophat = preload("res://Entities/Hemwick/Accessories/Head/TopHat.png")
var bell = preload("res://Entities/Hemwick/Accessories/Head/Bell.png")
var wizardhat = preload("res://Entities/Hemwick/Accessories/Head/WizardHat.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if PGS.Hat != "leaflantern":
		$Hat/LeafCirclet.visible = false

	if PGS.Hat != "bell":
		$Hat/GoldenBell.visible = false




	if PGS.Hat == "none":
		$Hat.texture = none
	elif PGS.Hat == "leaflantern":
		$Hat.texture = leaflantern
		$Hat/LeafCirclet.visible = true
	elif PGS.Hat == "hornedhelmet":
		$Hat.texture = hornedhelmet
	elif PGS.Hat == "oldhat":
		$Hat.texture = oldhat
	elif PGS.Hat == "oldhat2":
		$Hat.texture = oldhat2
	elif PGS.Hat == "austrianpainter":
		$Hat.texture = austrianpainter
	elif PGS.Hat == "monocle":
		$Hat.texture = monocle
	elif PGS.Hat == "tophat":
		$Hat.texture = tophat
	elif PGS.Hat == "bell":
		$Hat.texture = bell
	elif PGS.Hat == "wizardhat":
		$Hat.texture = wizardhat
