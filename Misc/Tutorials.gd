extends CanvasLayer


var animfinish = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _reset():
	$MoveBasic.visible = false
	$Interact.visible = false
	$WallJumping.visible = false
	$Attack.visible = false
	$AirAttack.visible = false
	$DodgeDash.visible = false
	$AirDash.visible = false
	$SlamAttack.visible = false
	$Gardening.visible = false
	$Inventory.visible = false
	$Dread.visible = false
	$SkillPoints.visible = false
	self.visible = false

func _physics_process(_delta):
	pass



