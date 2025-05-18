extends StaticBody2D


export var times_hit1 = 0
export var times_hit2 = 0
export var times_hit3 = 0
export var times_hit4 = 0
export var times_hit5 = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if times_hit1 >= 3:
		times_hit1 = 3

	if times_hit2 >= 3:
		times_hit2 = 3

	if times_hit3 >= 3:
		times_hit3 = 3

	if times_hit4 >= 3:
		times_hit4 = 3

	if times_hit5 >= 3:
		times_hit5 = 3


func _on_HitBox1_area_entered(_area):
	times_hit1 += 1

	if times_hit1 == 1:
		$Sprite1/HitAnim.play("1")
	if times_hit1 == 2:
		$Sprite1/HitAnim.play("2")
	if times_hit1 == 3:
		$Sprite1/HitAnim.play("3")

func _on_HitBox2_area_entered(_area):
	times_hit2 += 1

	if times_hit2 == 1:
		$Sprite2/HitAnim.play("1")
	if times_hit2 == 2:
		$Sprite2/HitAnim.play("2")
	if times_hit2 == 3:
		$Sprite2/HitAnim.play("3")


func _on_HitBox3_area_entered(_area):
	times_hit3 += 1

	if times_hit3 == 1:
		$Sprite3/HitAnim.play("1")
	if times_hit3 == 2:
		$Sprite3/HitAnim.play("2")
	if times_hit3 == 3:
		$Sprite3/HitAnim.play("3")


func _on_HitBox4_area_entered(_area):
	times_hit4 += 1

	if times_hit4 == 1:
		$Sprite4/HitAnim.play("1")
	if times_hit4 == 2:
		$Sprite4/HitAnim.play("2")
	if times_hit4 == 3:
		$Sprite4/HitAnim.play("3")


func _on_HitBox5_area_entered(_area):
	times_hit5 += 1

	if times_hit5 == 1:
		$Sprite5/HitAnim.play("1")
	if times_hit5 == 2:
		$Sprite5/HitAnim.play("2")
	if times_hit5 == 3:
		$Sprite5/HitAnim.play("3")
