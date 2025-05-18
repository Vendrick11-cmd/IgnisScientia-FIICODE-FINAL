extends Control

var stams = 100 setget set_stams
var max_stams = 100 setget set_max_stams
var max_stams_background = 100 setget set_max_stams_background

func _physics_process(_delta):
		self.max_stams_background = PlayerStats.max_stamina

func set_stams(value) :
	stams = clamp(value, 0, max_stams)
	if $StaminaFill != null :
		$StaminaFill.rect_size.x = stams * 10.88

func set_max_stams(value) :
	max_stams = max(value, 1)
	self.stams = min(stams, max_stams)
	if $Staminacontour != null:
		$Staminacontour.rect_size.x = max_stams * 10.88

func set_max_stams_background(value):
	max_stams_background = max(value, 1)
	self.stams = min(stams, max_stams_background)
	if $StaminaBackground != null:
		$StaminaBackground.rect_size.x = max_stams * 10.88

func _ready() :
	self.max_stams = PlayerStats.max_stamina
	self.stams = PlayerStats.stamina
	self.max_stams_background = PlayerStats.max_stamina
	PlayerStats.connect("stamina_changed", self, "set_stams")
	PlayerStats.connect("max_stamina_changed", self, "set_max_stams")
	PlayerStats.connect("max_stamina_changed", self, "set_max_stams_background")
