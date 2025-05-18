extends Node2D

var characters = {
	"caen":{},
	"hemwick":{},
	"cruxius":{},
	"drake":{},
	"willy":{},
	"eleanore":{}
}

onready var talking = "hemwick"




#BEGIN
var noway = false
var thiscould = false

var woundedman = false
var caen = false

var willy = false


var cruxius = false
var cruxius_dissolve = false

var eleanore_fade = false

#LEVEL1DUNGEON
var drake = false










func _pause():
	PGS.in_dialogue = true
	PGS.can_attack = false

func _unpause():
	PGS.in_dialogue = false
	DialogueTimer.start()





#CHARACTERS

func _cruxius_dialogue_over():
	cruxius_dissolve = true

func _eleanore_fade():
	eleanore_fade = true

# TALKING

func _caen():
	talking = "caen"
func _hemwick():
	talking = "hemwick"
func _cruxius():
	talking = "cruxius"
func _drake():
	talking = "drake"
func _willy():
	talking = "willy"
func _eleanore():
	talking = "eleanore"




