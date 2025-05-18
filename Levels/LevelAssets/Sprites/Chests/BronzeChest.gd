extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_HurtBox_area_entered(area):
	$AnimationPlayer.play("Open")
	$GoldDrop.base_gold_drop += rand_range(5,50)
	$GoldDrop.drop_gold()
	InventoryLoad.rosemary += randi() % 2
	InventoryLoad.charcoal += randi() % 2
	InventoryLoad.ginseng += randi() % 2
	InventoryLoad.ginger += randi() % 2
	InventoryLoad.nettle += randi() % 2
	InventoryLoad.thistle += randi() % 2
	InventoryLoad.lavender += randi() % 2
	InventoryLoad.yarrow += randi() % 2
	InventoryLoad.comfrey += randi() % 2
	InventoryLoad.valerian += randi() % 2
	InventoryLoad.mugwort += randi() % 2
	InventoryLoad.blue_lotus += randi() % 2
	InventoryLoad.mandrake += randi() % 2
	InventoryLoad.honey += randi() % 2
	InventoryLoad.plantain += randi() % 2
	InventoryLoad.billberry += randi() % 2
	InventoryLoad.garlic += randi() % 2
	InventoryLoad.eyebright += randi() % 2
	InventoryLoad.bonemeal += randi() % 2
	InventoryLoad.bones += randi() % 2
	InventoryLoad.bonemarrow += randi() % 2
	InventoryLoad.lucky_clover += randi() % 2
	PGS.Name = "Ingredients Acquired!"
	IAdd.start()



