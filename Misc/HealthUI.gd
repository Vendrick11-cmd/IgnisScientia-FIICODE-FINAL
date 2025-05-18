extends Control

var hearts = 100 setget set_hearts
var max_hearts = 100 setget set_max_hearts
var max_hearts_background = 100 setget set_max_hearts_background

func _physics_process(_delta):
	self.max_hearts_background = PlayerStats.max_health

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if $HealthFill != null :
		$HealthFill.rect_size.x = hearts * 10.88


func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if $Healthcontour != null:
		$Healthcontour.rect_size.x = max_hearts * 10.88

func set_max_hearts_background(value):
	max_hearts_background = max(value, 1)
	self.hearts = min(hearts, max_hearts_background)
	if $HealthBackground != null:
		$HealthBackground.rect_size.x = max_hearts * 10.88

func _ready() :
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	self.max_hearts_background = PlayerStats.max_health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts_background")
