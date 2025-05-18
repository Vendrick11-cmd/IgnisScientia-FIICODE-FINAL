extends Node



signal fps_displayed(value)



func toggle_fullscreen(toggle):
	OS.window_fullscreen = toggle
	Save.game_data.fullscreen_on = toggle
	Save.save_data()
	
	
func toggle_vsync(toggle):
	OS.vsync_enabled = toggle
	Save.game_data.vsync_on = toggle
	Save.save_data()
	
	
func toggle_fps_display(toggle):
	emit_signal("fps_displayed", toggle)
	Save.game_data.display_fps = toggle
	Save.save_data()
	
	
func set_max_fps(value):
	Engine.target_fps = value if value < 500 else 0
	Save.game_data.max_fps = Engine.target_fps if value < 500 else 500
	Save.save_data()
	
	
	
	
	
func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	Save.game_data.master_vol = vol
	Save.save_data()
	
	
func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	Save.game_data.music_vol = vol
	Save.save_data()
	
		
func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	Save.game_data.sfx_vol = vol
	Save.save_data()
	

	

