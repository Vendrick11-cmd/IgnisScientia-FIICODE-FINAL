extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if CharmsInv.has_charm("WhisperBrand"):
		get_node("Enemies").visible = false
	else:
		get_node("Enemies").visible = true

	if CharmsInv.has_charm("InvertedVertigo"):
		$"../../StartRoom/CameraAnchor/Camera2D".rotation_degrees = lerp($"../../StartRoom/CameraAnchor/Camera2D".rotation_degrees, 180, 2 * delta)
	else:
		$"../../StartRoom/CameraAnchor/Camera2D".rotation_degrees = lerp($"../../StartRoom/CameraAnchor/Camera2D".rotation_degrees, 0, 2 * delta)


	if $Enemies.get_child_count() == 0:
		$IronBars/AnimationPlayer.play("Up")
		$IronBars2/AnimationPlayer.play("Up")


func _on_Area2D_body_entered(body):
	CharmsInv.RAGE_STRENGTH = 0
	CharmsInv.EARTHBOUND_STRENGTH = 0
	if CharmsInv.has_charm("GamblersMemento"):
		CharmsInv.stats_reroll()


	var cam = $"../../StartRoom/CameraAnchor/Camera2D"
	cam.smoothing_enabled = true

	# Start coroutine to disable after 1.0 seconds
	if !CharmsInv.has_charm("InvertedVertigo"):
		disable_smoothing_after_delay(cam, 2)
	else:
		pass
	CharmsInv.update_charm_effects()
	$"../../StartRoom/CameraAnchor/Camera2D".limit_left = $CameraLimits/Left.global_position.x
	$"../../StartRoom/CameraAnchor/Camera2D".limit_top = $CameraLimits/Top.global_position.y
	$"../../StartRoom/CameraAnchor/Camera2D".limit_right = $CameraLimits/Right.global_position.x
	$"../../StartRoom/CameraAnchor/Camera2D".limit_bottom = $CameraLimits/Bottom.global_position.y
	#$"../../StartRoom/Camera2D".zoom.x = 0.18
	#$"../../StartRoom/Camera2D".zoom.y = 0.18
	#$"../../StartRoom/Hemwick/RemoteTransform2D".update_position = false
	$IronBars/AnimationPlayer.play("Up")
	$IronBars2/AnimationPlayer.play("Up")


func _on_Area2D_body_exited(body):
	$IronBars/AnimationPlayer.play("Down")
	$IronBars2/AnimationPlayer.play("Down")


func disable_smoothing_after_delay(camera, delay_time):
	var timer = get_tree().create_timer(delay_time)
	yield(timer, "timeout")
	camera.smoothing_enabled = false




func _on_ShutArea_body_entered(body):
	$IronBars/AnimationPlayer.play("Down")
	$IronBars2/AnimationPlayer.play("Down")
