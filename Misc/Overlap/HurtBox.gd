extends Area2D


const HitEffect = preload("res://Misc/Overlap/HitEffect.tscn")
export var hurteffect_show = true




func _on_HurtBox_area_entered(_area):
	if hurteffect_show == true :
		var effect = HitEffect.instance()
		var main = get_tree().current_scene
		main.call_deferred("add_child",effect)
		effect.global_position = global_position
