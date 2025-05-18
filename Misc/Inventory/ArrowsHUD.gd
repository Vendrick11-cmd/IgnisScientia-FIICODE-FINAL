extends Node2D



var simplearrow = preload("res://Entities/Hemwick/Bows/Arrows/SimpleArrow.png")
var firearrow = preload("res://Entities/Hemwick/Bows/Arrows/FireArrow.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	$ArrowSlot1/ArrowNumber.text = "%s" % [PGS.slot1number]


	if PGS.slot1number == 0:
		PGS.slot1 = "none"
		PGS.slot1_busy = false

	#SLOT 1 ---------------------------------------------------------------------------------
	if PGS.slot1 == "none":
		$ArrowSlot1/ArrowNumber.visible = false
		$ArrowSlot1/Arrow1.visible = false
	else:
		$ArrowSlot1/Arrow1.visible = true
		$ArrowSlot1/ArrowNumber.visible = true


	if PGS.slot1 == "simplearrow":
		$ArrowSlot1/Arrow1.texture = simplearrow
	elif PGS.slot1 == "firearrow":
		$ArrowSlot1/Arrow1.texture = firearrow














