extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	preload("res://Entities/Level2 - Forest/MushroomMan2/Fireball.tscn")
	preload("res://Misc/Coins/5GoldCoin.tscn")
	preload("res://Misc/Coins/10GoldCoin.tscn")
	preload("res://Misc/Coins/25GoldCoin.tscn")

func _physics_process(delta):
	if $"Misc/Light-Dark".is_colliding() :
		$CanvasModulate/CanvAnim.play("Light-Dark")
		$"Misc/Light-Dark".enabled = false
	if $Misc/Dark.is_colliding() :
		$CanvasModulate/CanvAnim.play("Dark")
		$Misc/Dark.enabled = false
	if $Misc/Darker.is_colliding() :
		$CanvasModulate/CanvAnim.play("Darker")
		$Misc/Darker.enabled = false
	if $"Misc/Darker-Abyssmal".is_colliding() :
		$"Misc/Darker-Abyssmal".enabled = false
		$CanvasModulate/CanvAnim.play("Darker-Abyssmal")
	if $Misc/Abyssmal.is_colliding() :
		$Misc/Abyssmal.enabled = false
		$CanvasModulate/CanvAnim.play("Abyssmal")
