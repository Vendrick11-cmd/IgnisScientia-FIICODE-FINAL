extends Camera2D


onready var shakeTimer = $Timer
onready var tween = $Tween




var shake_amount = 0
var default_offset = offset


func _ready():
	PGS.camera = self
	set_process(false)


func _process(delta):



	offset = Vector2(rand_range(-shake_amount, shake_amount), rand_range(-shake_amount, shake_amount)) * delta + default_offset


func shake(new_shake, shake_time=0.4, shake_limit=100):
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit

	shakeTimer.wait_time = shake_time

	tween.stop_all()
	set_process(true)
	shakeTimer.start()


func _on_Timer_timeout():
	shake_amount = 0
	set_process(false)

	tween.interpolate_property(self, "offset", offset, default_offset,
	0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()
