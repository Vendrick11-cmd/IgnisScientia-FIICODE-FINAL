extends Node


export var max_health = 1 setget set_max_health
var health = max_health setget set_health
export var max_living = 1 setget set_max_living
var living = max_living setget set_living
export var max_stamina = 1 setget set_max_stamina
var stamina = max_stamina setget set_stamina
export var max_mana = 1 setget set_max_mana
var mana = max_mana setget set_mana
export var max_armor = 1 setget set_max_armor
var armor = max_armor setget set_armor




signal armor_changed(value)
signal max_armor_changed(value)
signal no_health
signal health_changed(value)
signal max_health_changed(value)

signal living_changed(value)
signal max_living_changed(value)

signal stamina_changed(value)
signal max_stamina_changed(value)

signal mana_changed(value)
signal max_mana_changed(value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed",value)

func set_health(value) :
	health = value
	emit_signal("health_changed", health)
	if health <= 0 :
		emit_signal("no_health")

func set_max_living(value) :
	max_living = value
	self.living = min(living, max_living)
	emit_signal("max_living_changed",value)

func set_living(value) :
	living = value
	emit_signal("living_changed", living)

func set_max_stamina(value) :
	max_stamina = value
	self.stamina = min(stamina, max_stamina)
	emit_signal("max_stamina_changed",value)

func set_stamina(value) :
	stamina = value
	emit_signal("stamina_changed", stamina)

func set_max_mana(value):
	max_mana = value
	self.mana = min(mana, max_mana)
	emit_signal("max_mana_changed", value)

func set_mana(value):
	mana = value
	emit_signal("mana_changed", mana)

func set_max_armor(value):
	max_armor = value
	self.armor = min(armor, max_armor*50)
	emit_signal("max_armor_changed",value)

func set_armor(value):
	armor = value
	emit_signal("armor_changed", armor)







func _ready():
	self.mana = max_mana
	self.health = max_health
	self.living = max_living
	self.stamina = max_stamina
	self.armor = max_armor * 50


