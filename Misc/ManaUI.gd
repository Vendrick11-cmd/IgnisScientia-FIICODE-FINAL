extends Control

var mana = 100 setget set_mana
var max_mana = 100 setget set_max_mana
var max_mana_background = 100 setget set_max_mana_background

func _physics_process(_delta):
		self.max_mana_background = PlayerStats.max_mana

func set_mana(value) :
	mana = clamp(value, 0, max_mana)
	if $ManaFill != null :
		$ManaFill.rect_size.x = mana * 10.88

func set_max_mana(value) :
	max_mana = max(value, 1)
	self.mana = min(mana, max_mana)
	if $Manacontour != null:
		$Manacontour.rect_size.x = max_mana * 10.88

func set_max_mana_background(value):
	max_mana_background = max(value, 1)
	self.mana = min(mana, max_mana_background)
	if $ManaBackground != null:
		$ManaBackground.rect_size.x = max_mana * 10.88

func _ready() :
	self.max_mana = PlayerStats.max_mana
	self.mana = PlayerStats.mana
	self.max_mana_background = PlayerStats.max_mana
	PlayerStats.connect("mana_changed", self, "set_mana")
	PlayerStats.connect("max_mana_changed", self, "set_max_mana")
	PlayerStats.connect("max_mana_changed", self, "set_max_mana_background")
