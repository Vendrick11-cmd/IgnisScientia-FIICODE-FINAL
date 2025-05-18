extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_HurtBox_area_entered(area):
	$AnimationPlayer.play("Open")
	$GoldDrop.base_gold_drop += rand_range(25,100)
	$GoldDrop.drop_gold()
	InventoryLoad.rosemary += randi() % 3
	InventoryLoad.charcoal += randi() % 3
	InventoryLoad.ginseng += randi() % 3
	InventoryLoad.ginger += randi() % 3
	InventoryLoad.nettle += randi() % 3
	InventoryLoad.thistle += randi() % 3
	InventoryLoad.lavender += randi() % 3
	InventoryLoad.yarrow += randi() % 3
	InventoryLoad.comfrey += randi() % 3
	InventoryLoad.valerian += randi() % 3
	InventoryLoad.mugwort += randi() % 3
	InventoryLoad.blue_lotus += randi() % 3
	InventoryLoad.mandrake += randi() % 3
	InventoryLoad.honey += randi() % 3
	InventoryLoad.plantain += randi() % 3
	InventoryLoad.billberry += randi() % 3
	InventoryLoad.garlic += randi() % 3
	InventoryLoad.eyebright += randi() % 3
	InventoryLoad.bonemeal += randi() % 3
	InventoryLoad.bones += randi() % 3
	InventoryLoad.bonemarrow += randi() % 3
	InventoryLoad.lucky_clover += randi() % 3
	PGS.Name = "Ingredients Acquired!"
	IAdd.start()



