extends Node2D

# Define your coin scenes, values, and appearance weight (for splashy low coins)
const COIN_TYPES = [
	{"scene": preload("res://Misc/Coins/5GoldCoin.tscn"), "value": 1, "weight": 50},
	{"scene": preload("res://Misc/Coins/10GoldCoin.tscn"), "value": 2, "weight": 30},
	{"scene": preload("res://Misc/Coins/25GoldCoin.tscn"), "value": 3, "weight": 20},
]

var base_gold_drop : int = 10

func drop_gold():
	if CharmsInv.has_charm("VoidKnuckle"):
		var bomb = preload("res://Effects/ExplosionTypes/Bomb.tscn").instance()
		get_tree().current_scene.call_deferred("add_child", bomb)
		bomb.global_position = global_position + Vector2(randf() * 32 - 16, randf() * 32 - 16)

	var total_gold = calculate_gold_amount(base_gold_drop)
	while total_gold > 0:
		var coin = get_random_coin_type()
		# Only spawn if coin value fits (unless you want to allow overshooting for chaos mode)
		if coin["value"] <= total_gold:
			var coin_instance = coin["scene"].instance()
			get_tree().current_scene.call_deferred("add_child", coin_instance)
			coin_instance.global_position = global_position + Vector2(randf() * 32 - 16, randf() * 32 - 16)
			total_gold -= coin["value"]
		else:
			# Optional chaos mode:
			if randi() % 100 < 10: # 10% chance to still overshoot
				var coin_instance = coin["scene"].instance()
				get_tree().current_scene.call_deferred("add_child", coin_instance)
				coin_instance.global_position = global_position + Vector2(randf() * 64 - 32, randf() * 64 - 32)
				total_gold = 0 # End it all


func calculate_gold_amount(base_gold):
	var gold = base_gold
	if PlayerSkills.Looting and PGS.Current_Equipped in PGS.DaggersWeapons:
		gold += rand_range(0,2)
	if PGS.LuckI:
		gold += rand_range(0,3)
	if PGS.LuckII:
		gold += rand_range(1,4)
	if PGS.luckpotion:
		gold += rand_range(1,2)
	if CharmsInv.has_charm("GoldenEye"):
		gold += rand_range(3,6)
	if CharmsInv.has_charm("GrimPact"):
		gold += rand_range(6,10)
	if CharmsInv.has_charm("CursedHourglass"):
		gold += rand_range(5,8)
	if CharmsInv.has_charm("BloodForged"):
		if get_parent().name == "Hemwick":
			gold += 0
		else:
			gold += rand_range(2,8)
	return gold

func get_random_coin_type():
	var total_weight = 0
	for coin in COIN_TYPES:
		total_weight += coin["weight"]
	var pick = randi() % total_weight
	var running = 0
	for coin in COIN_TYPES:
		running += coin["weight"]
		if pick < running:
			return coin
	return COIN_TYPES[0] # Failsafe




