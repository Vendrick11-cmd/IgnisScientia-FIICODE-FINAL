extends Node



onready var SpawnPosX = 0
onready var SpawnPosY = 0
onready var skillpoints = 99
onready var coins = 0
onready var MAXSPEED = 100
onready var JUMPFORCE = 400
onready var STRENGTH = 1.00







var camera = null

# ADDINVENTORY -------------------------------------------------------------------------------------
onready var Name = ""
onready var PickUp = false

# PLAYER ----------------------------------------------------------------------------------------------------------
onready var undying = false
onready var luckpotion = false
onready var invis = false


onready var is_buffed = false
onready var is_moving = false
onready var is_on_floor = false
onready var has_found_pet = true
onready var in_vehicle = false
onready var submerged = false
onready var is_facing_left = false
onready var changed_weapon = false
onready var has_jumped = false
onready var airdashed = false
onready var lamp_on = false
onready var is_blocking = false
onready var in_dialogue = false

onready var harvested = false
onready var found_drake = false



onready var can_shoot = false
onready var can_attack = false


#TUTORIALS
onready var movetut = false
onready var interacttut = false
onready var walljumptut = false
onready var harvesttut = false
onready var attacktut = false
onready var airattacktut = false
onready var dodgetut = false
onready var slamtut = false
onready var gardtut = false
onready var alchemytut = false
onready var inventorytut = false
onready var skilltut = false
onready var dreadtut = false
onready var airdashtut = false


#ARMS-------------------------------------------------------------------------------------------------------------------

var weapons = {
	"dagger":{
		"duration" : 0.28,
		"slideduration" : 0.1,
		"sheet" : "Dagger",
		"sheetheavy" : "DaggerH",
		"damage" : 5,
		"staminadrain": 5
	},
	"shovel":{},
	"unarmed":{},
	"fireball":{},
	"bow":{},
	"celeste":{
		"duration" : 0.55,
		"heavyduration" : 0.85,
		"slideduration" : 0.2,
		"heavyslideduration" : 0.01,
		"sheet" : "Celeste",
		"sheetheavy" : "CelesteH",
		"damage": 8,
		"staminadrain" : 8
	},
	"hemwicksword":{}
}

var DaggersWeapons = ["dagger"]
var SwordWeapons = ["hemwicksword"]
var ShortSwordsWeapons = ["celeste"]
var RangedWeapons = ["bow"]
var SpearsWeapons = ["spear"]
var SpecialWeapons =["shovel"]
var MagicWeapons = ["fireball"]

onready var Primary = "celeste"
onready var Secondary = "dagger"
onready var Current_Equipped = Primary
onready var Current_Talisman = null
onready var PrimarySelect = true
onready var pickup_weaponprimary = false
onready var pickup_weaponsecondary = false

var hats = {
	"none":{},
	"leaflantern":{},
	"hornedhelmet":{},
	"oldhat":{},
	"oldhat2":{},
	"austrianpainter":{},
	"monocle":{},
	"tophat":{},
	"bell":{},
	"wizardhat":{}
}

onready var Hat = "wizardhat"


var arrowtypes = {
	"simplearrow":{},
	"firearrow":{},
	"none":{}
}

var slot1 = "firearrow"
var slot1number = 30


var slot1_busy = true
onready var arrow_damage = 0

onready var shield_buckler = false
onready var shield_heater = false


#WEAPONS STAMINA-------------------------------------------------------------------------------------------------------------------
onready var stamina_factor = 0.06
onready var stamina_factor_charms = 0

#POISON/HEALTH-----------------------------------------
onready var poison_factor = 0
onready var heal_factor = 0
onready var heal_factor_charms = 0


#FLOOR ----------------------------------------------------------------------------------------------------------
onready var on_grass = false
onready var on_concrete = false
onready var on_planks = false
onready var on_metal = false

#MOVEMENT ----------------------------------------------------------------------------------------------------------
onready var walk = false

#ELEMENTS & EFFECTS ----------------------------------------------------------------------------------------------------------
onready var TEMP = 0
onready var fire = false
onready var DREAD = 0
onready var MAX_DREAD = 30


#GUI ----------------------------------------------------------------------------------------------------------
onready var skillstree = false
onready var inventory = false
onready var charactermenu = false
onready var alchemy = false

#SKILLS ----------------------------------------------------------------------------------------------------------
onready var skill_selector = 0
onready var active_skill = false
#CHARACTER ----------------------------------------------------------------------------------------------------------
onready var sight = false
onready var sightII = false
onready var HealthI = false
onready var HealthII = false
onready var HealthIII = false
onready var Embrace = false
onready var Bite = false
onready var BiteII = false
onready var BiteIII = false
onready var ShieldBreaker = false
onready var Bandage = false
onready var Toughness = false
onready var HeavyChain = true
onready var FireProt = false
onready var ThreeCombo = true
onready var FiveCombo = true
onready var DreadedHeal = false
onready var FeralDread = false
onready var Feared = false
onready var LuckI = false
onready var LuckII = false
onready var Strength = false
onready var HealthPick = false
onready var LifeSteal = false
onready var Unleash = false
onready var VileBlood = false
onready var SecondChance = false
onready var Dash = true
onready var AirHeavy = false
onready var Slam = true
onready var JumpBoost = false
onready var DeadlyClaws = false
onready var SuddenStrike = false
onready var BloodLust = false
onready var Rage = false
onready var BloodSmell = false
onready var Devour = false

onready var FamiliarUnlocked = false
onready var FamItemFinder = false
onready var FamAttack = false
onready var FamInstinct = false
onready var FamCat = false
onready var FamRaven = false
onready var FamParrot = false
onready var FamWolf = false



# ARMS DURABILITY ----------------------------------------------------------------------------------------------------------
onready var shield_buckler_hp = 25
onready var shield_heater_hp = 50
# Called when the node enters the scene tree for the first time.

#DEFAULTS ---------------------------------------------------------
onready var default_MAXSPEED = 100
onready var default_JUMPFORCE = 400
onready var default_MAXHEALTH = 60
onready var default_MAXMANA = 30
onready var default_MAXSTAMINA = 45
onready var default_STRENGTH = 1.00
onready var default_stamina_factor = 0.06
onready var default_stamina_factor_charms = 0
onready var default_heal_factor = 0
onready var default_heal_factor_charms = 0
onready var default_poison_factor = 0
onready var default_TIMESCALE = 1

func _defaults_calc():
#HEALTH -------------------------------
	if HealthI:
		default_MAXHEALTH = 70
	if HealthII:
		default_MAXHEALTH = 110
	if HealthIII:
		default_MAXHEALTH = 150

#STRENGTH -------------------------------------------
func _dread_calc():



	if DREAD > 0:
		if FeralDread:
			DREAD -= 0.001
		elif DreadedHeal:
			DREAD -= 0.003
		else:
			DREAD -= 0.005


func _ready():
	pass


func _physics_process(_delta):
	if coins <= 0:
		coins = 0

	_defaults_calc()

	if slot1number <=0 :
		slot1 = "none"
		slot1number = 0


	if !slot1 == "none":
		slot1_busy = true
	else:
		slot1_busy = false


	if slot1 == "none":
		slot1number = 0


	if Input.is_action_pressed("RIGHT") or Input.is_action_pressed("LEFT"):
		is_moving = true
	else :
		is_moving = false





	# STATUS EFFECTS ----------------------------------------------------------------------------------------------------------
		# FIRE
	if TEMP < -20 :
		TEMP = -20
	if TEMP > 20 :
		TEMP = 20

	if DREAD > MAX_DREAD :
		DREAD = MAX_DREAD
	if DREAD < 0:
		DREAD = 0



#----------------------------------------------------------------------------------------------------------
	if on_concrete == true :
		on_planks = false
		on_metal = false
		on_grass = false
	elif on_grass == true :
		on_concrete = false
		on_metal = false
		on_planks = false
	elif on_metal == true :
		on_concrete = false
		on_grass = false
		on_planks = false
	elif on_planks == true :
		on_concrete = false
		on_metal = false
		on_grass = false
