extends Node2D


var Charms = {
	"Berserker":{},
	"BindingFeather":{},
	"BloodForged":{},
	"Confusion":{},
	"CursedHeart":{},
	"CursedHourglass":{},
	"EarthBound":{},
	"FinalToll":{},
	"GamblersMemento":{},
	"GildedScar":{},
	"GlacialEmbrace":{},
	"Glass":{},
	"GoldenEye":{},
	"GrimLedger":{},
	"GrimPact":{},
	"Haste":{},
	"InvertedWill":{},
	"Leech":{},
	"Mirror":{},
	"Momentum":{},
	"ObsidianCharm":{},
	"PhantomScar":{},
	"Puppet":{},
	"Rage":{},
	"Reversal":{},
	"VoidKnuckle":{},
	"WhisperBrand":{}
}
var Charms_keys = Charms.keys()
var Current_Charm = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	Current_Charm = Charms_keys[randi() % Charms_keys.size()]
	#Current_Charm = "EarthBound"
	$CharmType.play(Current_Charm)







func _physics_process(_delta):
	if $InteractRay.is_colliding():
		$Sprite/AppearAnim.play("Appear")
		$Sprite/AnimationPlayer.play(Current_Charm)

		if Input.is_action_just_pressed("Interact"):
			if not CharmsInv.has_charm(Current_Charm):
				CharmsInv.add_charm(Current_Charm)
				$AnimationPlayer.play("Remove")
				PGS.Name = "New Charm Collected!"
				IAdd.start()
				$InteractRay.enabled = false
				CharmsInv.changed_charm = true
				$ChangedTimer.start()
				$Sprite/AppearAnim.play("Disappear")
	else:
		$Sprite/AppearAnim.play("Disappear")









func _on_Timer_timeout():
	CharmsInv.changed_charm = false
