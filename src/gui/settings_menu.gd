extends Control

# Video Settings
onready var display_options = $Video/DisplayOptions
onready var vsync_btn = $Video/VsyncBtn
onready var display_fps_btn = $Video/DisplayFpsBtn
onready var max_fps_val = $Video/MaxFpsVal
onready var max_fps_slider = $Video/MaxFpsSlider
onready var fps_btn = $Video/DisplayFpsBtn

# Audio Settings
onready var master_slider = $Audio/MasterSlider
onready var music_slider = $Audio/MusicSlider
onready var sfx_slider = $Audio/SfxSlider



func _ready():

	display_options.select(1 if Save.game_data.fullscreen_on else 0)
	GlobalSettings.toggle_fullscreen(Save.game_data.fullscreen_on)
	vsync_btn.pressed = Save.game_data.vsync_on
	display_fps_btn.pressed = Save.game_data.display_fps
	max_fps_slider.value = Save.game_data.max_fps


	master_slider.value = Save.game_data.master_vol
	music_slider.value = Save.game_data.music_vol
	sfx_slider.value = Save.game_data.sfx_vol


func _physics_process(_delta):
	if $Video/DisplayFpsBtn.pressed == true:
		FpsLabel.active = true
	else:
		FpsLabel.active = false

func _on_OptionButton_item_selected(index):
	GlobalSettings.toggle_fullscreen(true if index == 1 else false)


func _on_CheckButton_toggled(button_pressed):
	GlobalSettings.toggle_vsync(button_pressed)


func _on_DisplayFpsBtn_toggled(button_pressed):
	GlobalSettings.toggle_fps_display(button_pressed)
	FpsLabel.active = true

func _on_MaxFpsSlider_value_changed(value):
	GlobalSettings.set_max_fps(value)
	max_fps_val.text = str(value) if value < max_fps_slider.max_value else "max"


func _on_MasterSlider_value_changed(value):
	GlobalSettings.update_master_vol(value)

func _on_MusicSlider_value_changed(value):
	GlobalSettings.update_music_vol(value)


func _on_SfxSlider_value_changed(value):
	GlobalSettings.update_sfx_vol(value)



func _on_VideoSettings_pressed():
	$Click.play()
	$Video.visible = true
	$Audio.visible = false
	$Controls.visible = false


func _on_AudioSettings_pressed():
	$Click.play()
	$Video.visible = false
	$Audio.visible = true
	$Controls.visible = false



func _on_ControlsSettings_pressed():
	$Click.play()
	$Video.visible = false
	$Audio.visible = false
	$Controls.visible = true


func _on_VideoSettings_mouse_entered():
	$Hover.play()
	$VideoSettings/VideoAnim.play("Hover")
func _on_VideoSettings_mouse_exited():
	$VideoSettings/VideoAnim.play("Inactive")


func _on_AudioSettings_mouse_entered():
	$Hover.play()
	$AudioSettings/AudioAnim.play("Hover")
func _on_AudioSettings_mouse_exited():
	$AudioSettings/AudioAnim.play("Inactive")


func _on_ControlsSettings_mouse_entered():
	$Hover.play()
	$ControlsSettings/ControlsAnim.play("Hover")

func _on_ControlsSettings_mouse_exited():
	$ControlsSettings/ControlsAnim.play("Inactive")

