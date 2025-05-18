extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _on_HurtBox_area_entered(area):
	$AnimationPlayer.play("Open")
	$GoldDrop.base_gold_drop += rand_range(50,200)
	$GoldDrop.drop_gold()
	InventoryLoad.rosemary += randi() % 4
	InventoryLoad.charcoal += randi() % 4
	InventoryLoad.ginseng += randi() % 4
	InventoryLoad.ginger += randi() % 4
	InventoryLoad.nettle += randi() % 4
	InventoryLoad.thistle += randi() % 4
	InventoryLoad.lavender += randi() % 4
	InventoryLoad.yarrow += randi() % 4
	InventoryLoad.comfrey += randi() % 4
	InventoryLoad.valerian += randi() % 4
	InventoryLoad.mugwort += randi() % 4
	InventoryLoad.blue_lotus += randi() % 4
	InventoryLoad.mandrake += randi() % 4
	InventoryLoad.honey += randi() % 4
	InventoryLoad.plantain += randi() % 4
	InventoryLoad.billberry += randi() % 4
	InventoryLoad.garlic += randi() % 4
	InventoryLoad.eyebright += randi() % 4
	InventoryLoad.bonemeal += randi() % 4
	InventoryLoad.bones += randi() % 4
	PGS.Name = "Ingredients Acquired!"
	IAdd.start()
	InventoryLoad.bonemarrow += randi() % 4
	InventoryLoad.lucky_clover += randi() % 4



