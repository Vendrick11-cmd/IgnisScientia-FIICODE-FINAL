extends Sprite


onready var stats = PlayerStats
onready var state_machine = $AnimationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if stats.health == stats.max_health or stats.health >= 100.0 :
		state_machine.travel("100")
	
	if stats.health <= stats.max_health / 1.2 :
		state_machine.travel("80")
	
	if stats.health <= stats.max_health / 1.8 :
		state_machine.travel("60")
	
	if stats.health <= stats.max_health / 2.2 :
		state_machine.travel("45")
	
	if stats.health <= stats.max_health / 3.1 :
		state_machine.travel("30")
		
	if stats.health <= stats.max_health / 4 :
		state_machine.travel("15")
	
	if stats.health <= 0 :
		state_machine.travel("Dead")
