extends Node

var MAX_CHARMS = 2
var COIN_STRENGTH = 0
var COIN_HEALTH_MINUS = 0
var MOMENTUM_TIME = 0
var FINALTOLL_NUMBER = 0
var FINALTOLL_STRENGTH = 0
var RAGE_STRENGTH = 0
var EARTHBOUND_STRENGTH = 0
var Charms = {
	"Berserker":{},
	"BindingFeather":{},
	"BloodForged":{},
	"Confusion":{},
	"CursedHeart":{},
	"CursedHourglass":{},
	"EarthBound":{},
	"FalseLight":{},
	"FinalToll":{},
	"GamblersMemento":{},
	"GildedScar":{},
	"GlacialEmbrace":{},
	"Glass":{},
	"GoldenEye":{},
	"GrimLedger":{},
	"GrimPact":{},
	"Haste":{},
	"HeavensDebt":{},
	"InvertedVertigo":{},
	"InvertedWill":{},
	"Leech":{},
	"MercenaryToken":{},
	"Mirror":{},
	"Momentum":{},
	"ObsidianCharm":{},
	"ParisiticGrowth":{},
	"PhantomScar":{},
	"Puppet":{},
	"Rage":{},
	"Reversal":{},
	"SearingBrand":{},
	"SoulPrism":{},
	"VoidKnuckle":{}
}
var Charms_keys = Charms.keys()


onready var changed_charm = false
onready var Current_Charms = []

var Leech = false #no heal potions, +2hp each enemy
var Glass = false #grants strength, max hp is halved
var GoldenEye = false #more money, each coin drains hp
var CursedHeart = false #constant hp regen, +50% damage from enemy
var Rage = false #+1 damage per hit taken, halves hp(resets when entering room)
var MercenaryToken = false #lowerprices, enemies drop no gold
var SearingBrand = false #inflict burn, -50% fire res
var GlacialEmbrace = false #reduce damage taken and speed
var ParisiticGrowth = false #more health from plants, chance to get poisoned when hit
var WatcherEye = false #reveal hidden rooms, sometimes you get blurry vision
var BindingFeather = false #increase jump height, cannot air dash
var ObsidianCharm = false #reduce damage taken and dealt
var BloodForged = false #gain damage as low as the health goes, starts with less hp
var VoidKnuckle = false #enemies explode on death
var GrimPact = false #increase damage and speed, no healing
var SoulPrism = false #increase spell damage, decrease physical
var PhantomScar = false #dash deals damage, it takes 1 hp
var Reversal = false #triple damage dealt, damage taken when attacking
var Mirror = false #50% more damage taken and dealt
var HeaveansDebt = false #free items in shops, need to defeat the debt collector after
var EarthBound = false #increase max health, can't dash
var GildedScar = false #take increased damage, drop gold when hit
var Berserker = false #if verylowhealth, give 3xdamage, if not, half the damage
var InvertedWill = false #attacks dash and vice versa
var Haste = false #take damage when standing still, gain speed
var WhisperBrand = false #enemies are invisible, you gain triple health and damage
var InvertedVertigo = false #you are upside down, you move faster and jump higher
var CursedHourlgass = false #time is slower, gain much more gold
var GrimLedger = false #everycoincollected increase attack and drains max hp
var FalseLight = false #picth black darkness, only you and the secrets are revealed
var Confusion = false #inverse right and left, deal more damage
var GamblersMemento = false #stats reroll when entering a room
var Puppet = false #another entity controls your dashes, gain speed and attack
var Momentum = false #infinite stamina, game speeds up with every hit, slows down every time you jump
var FinalToll = false #defy death, lose 80% money


func stats_reroll():
	if CharmsInv.has_charm("GamblersMemento"):
		PlayerStats.health = rand_range(1,PlayerStats.max_health)
		PlayerStats.max_health = rand_range(1,200)
		PlayerStats.max_mana = rand_range(20, 200)
		PlayerStats.max_stamina = rand_range(20,200)
		PlayerStats.mana = rand_range(20,PlayerStats.max_mana)
		PlayerStats.stamina = rand_range(20,PlayerStats.max_stamina)
		PGS.STRENGTH = rand_range(0.1,3)
		PGS.MAXSPEED = rand_range(20,350)
		PGS.JUMPFORCE = rand_range(400, 1400)


# Call this when you equip/remove a charm, or enter a new room, or respawn etc.
func update_charm_effects():





	PlayerStats.max_health = PGS.default_MAXHEALTH
	PGS.STRENGTH = PGS.default_STRENGTH
	PGS.MAXSPEED = PGS.default_MAXSPEED
	PGS.JUMPFORCE = PGS.default_JUMPFORCE
	PlayerStats.max_stamina = PGS.default_MAXSTAMINA
	PGS.heal_factor_charms = PGS.default_heal_factor_charms
	PGS.stamina_factor = PGS.default_stamina_factor
	PGS.stamina_factor_charms = PGS.default_stamina_factor_charms

	Engine.time_scale = PGS.default_TIMESCALE

	PGS.STRENGTH += COIN_STRENGTH
	PGS.STRENGTH += RAGE_STRENGTH
	PlayerStats.max_health -= COIN_HEALTH_MINUS
	PGS.STRENGTH += FINALTOLL_STRENGTH
	PGS.STRENGTH += EARTHBOUND_STRENGTH

	if PGS.DREAD > 20:
		if PGS.FeralDread:
			PGS.STRENGTH *= 2
		elif PGS.DreadedHeal:
			PGS.STRENGTH /= 1.4
		else:
			PGS.STRENGTH /= 2



	for charm_name in Current_Charms:
		match charm_name:
			"Glass":
				PlayerStats.max_health /= 2
				PGS.STRENGTH *= 1.75
			"CursedHeart":
				PGS.heal_factor_charms += 0.01
			"GlacialEmbrace":
				PGS.MAXSPEED -= 30
			"BindingFeather":
				PGS.JUMPFORCE += 250
			"ObsidianCharm":
				PGS.STRENGTH *= 0.5
			"GildedScar":
				PlayerStats.max_health /=  1.5
			"GrimPact":
				if PlayerStats.health < PGS.default_MAXHEALTH:
					PlayerStats.max_health = PlayerStats.health
				PGS.STRENGTH *= 3
				PGS.MAXSPEED += 60
			"Reversal":
				PGS.STRENGTH *= 4
			"Mirror":
				PGS.STRENGTH *= 2
			"Berserker":
				if PlayerStats.health < PlayerStats.max_health * 0.3:
					PGS.STRENGTH *= 3
				else:
					PGS.STRENGTH /= 2
			"InvertedWill":
				PGS.MAXSPEED += 30
			"Haste":
				PGS.MAXSPEED += 40
			"WhisperBrand":
				PGS.STRENGTH *= 6
			"InvertedVertigo":
				PGS.MAXSPEED += 50
				PGS.JUMPFORCE += 250
			"CursedHourglass":
				Engine.time_scale -= 0.2
			"Confusion":
				PGS.STRENGTH *= 2
			"Puppet":
				PGS.STRENGTH *= 2
				PGS.MAXSPEED += 60
			"Momentum":
				Engine.time_scale += MOMENTUM_TIME
			"FinalToll":
				if FINALTOLL_NUMBER >= PlayerStats.health:
					PlayerStats.max_health -= FINALTOLL_STRENGTH * 3
					FINALTOLL_NUMBER = 0
					FINALTOLL_STRENGTH = 0
			"Rage":
				PlayerStats.max_health /= 2









func add_charm(charm_name):
	if charm_name in Current_Charms:
		print("Already equipped: " + charm_name)
		return

	if Current_Charms.size() >= MAX_CHARMS:
		# Remove oldest before adding new
		Current_Charms.remove(0)
		print("Charm slot full, oldest removed.")

	Current_Charms.append(charm_name)
	print("Equipped charm: " + charm_name)

	# Always refresh effects AFTER adding
	update_charm_effects()

	# Always refresh GUI right after
	var GUI = get_tree().get_root().get_node("TestLevel/StartRoom/Hemwick/GUI")
	if GUI.has_node("VBoxContainer"):
		GUI.get_node("VBoxContainer").get_parent().update_charm_slots()



func remove_charm(charm_name):
	update_charm_effects()
	if charm_name in Current_Charms:
		Current_Charms.erase(charm_name)
		print("Removed charm: " + charm_name)



func has_charm(charm_name):
	return charm_name in Current_Charms

func clear_charms():
	Current_Charms.clear()
	print("All charms cleared.")

