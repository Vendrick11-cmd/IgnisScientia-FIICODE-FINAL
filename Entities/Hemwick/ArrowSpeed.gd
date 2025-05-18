extends Node2D


var speedone = false
var speedtwo = false
var speedthree = false
var speedfour = false
var speedfive = false

onready var simplearrow = preload("res://Entities/Hemwick/Bows/Arrows/SimpleArrow.png")
onready var firearrow = preload("res://Entities/Hemwick/Bows/Arrows/FireArrow.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _speedone():
	speedone = true

func _speedtwo():
	speedtwo = true

func _speedthree():
	speedthree = true

func _speedfour():
	speedfour = true

func _speedfive():
	speedfive = true

func _speedreset():
	speedone = false
	speedtwo = false
	speedthree = false
	speedfour = false
	speedfive = false

func _physics_process(_delta):
	if PGS.slot1 == "simplearrow":
		$"../Arrow".texture = simplearrow
		$RightHand/Arrow.texture = simplearrow
		$RightHand/Arrow/Fire.visible = false
		$"../Arrow/Fire".visible = false


	elif PGS.slot1 == "firearrow":
		$"../Arrow".texture = firearrow
		$RightHand/Arrow.texture = firearrow
		$RightHand/Arrow/Fire.visible = true
		$"../Arrow/Fire".visible = true



