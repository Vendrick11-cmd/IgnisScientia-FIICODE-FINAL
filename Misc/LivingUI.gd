extends Control


var living = 100 setget set_living
var max_living = 100 setget set_max_living
var max_living_background = 100 setget set_max_living_background

func _physics_process(_delta):
		self.max_living_background = PlayerStats.max_living

func set_living(value) :
	living = clamp(value, 0, max_living)
	if $LivingFill != null :
		$LivingFill.rect_size.x = living * 10.88

func set_max_living(value) :
	max_living = max(value, 1)
	self.living = min(living, max_living)
	if $Livingcontour != null:
		$Livingcontour.rect_size.x = max_living * 10.88

func set_max_living_background(value):
	max_living_background = max(value, 1)
	self.living = min(living, max_living_background)
	if $LivingBackground != null:
		$LivingBackground.rect_size.x = max_living_background * 10.88

func _ready() :
	self.max_living = PlayerStats.max_living
	self.living = PlayerStats.living
	self.max_living_background = PlayerStats.max_living
	PlayerStats.connect("living_changed", self, "set_living")
	PlayerStats.connect("max_living_changed", self, "set_max_living")
	PlayerStats.connect("max_living_changed", self, "set_max_living_background")
