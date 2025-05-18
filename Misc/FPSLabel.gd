extends CanvasLayer

var active = false


func _process(_delta):
	$FPS.text = "FPS : %s" % [Engine.get_frames_per_second()]
	if active == true:
		self.visible = true
	else:
		self.visible = false


