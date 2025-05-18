extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if PlayerStats.armor > PlayerStats.max_armor *50:
		PlayerStats.armor = PlayerStats.max_armor *50
	if PlayerStats.health > PlayerStats.max_health :
		PlayerStats.health = PlayerStats.max_health
	if PlayerStats.mana > PlayerStats.max_mana:
		PlayerStats.mana = PlayerStats.max_mana
	if PlayerStats.living > PlayerStats.max_living :
		PlayerStats.living = PlayerStats.max_living
	if PlayerStats.stamina > PlayerStats.max_stamina :
		PlayerStats.stamina = PlayerStats.max_stamina
	if PlayerStats.stamina < 0 :
		PlayerStats.stamina = 0







