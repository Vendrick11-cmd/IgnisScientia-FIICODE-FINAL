extends Control

var armor = 100 setget set_armor
var max_armor = 100 setget set_max_armor

func set_armor(value) :
	armor = clamp(value, 0, max_armor*50)
	if $Armor != null :
		$Armor.rect_size.x = armor * 1

func set_max_armor(value) :
	max_armor = max(value, 1)
	self.armor = min(armor, max_armor *50)
	if $ArmorBackground != null:
		$ArmorBackground.rect_size.x = max_armor * 50



func _ready() :

	self.armor = PlayerStats.armor
	self.max_armor = PlayerStats.max_armor

	PlayerStats.connect("armor_changed", self, "set_armor")
	PlayerStats.connect("max_armor_changed", self, "set_max_armor")
