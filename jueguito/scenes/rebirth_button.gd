extends Button

var default_text = "Next Rebirth: "
var bounces_needed_for_rebirth = 100
var rebirth_text = str(default_text, str(bounces_needed_for_rebirth))

var mostrando_aviso = false

func _process(delta):
	if not mostrando_aviso:
		var rebirth_text = str(default_text, str(bounces_needed_for_rebirth))
		self.text = (rebirth_text)
	if Global.rebirth:
		bounces_needed_for_rebirth=10
	
func _on_pressed():
	if bounces_needed_for_rebirth <= Global.bounce_counter:
		Global.rebirth = true
		Global.increase_multiplier +=1
		bounces_needed_for_rebirth = bounces_needed_for_rebirth * 10
		self.text = (rebirth_text)
		
		
	else:
		add_theme_color_override("font_color",Color.CRIMSON)
		add_theme_color_override("font_hover_color",Color.CRIMSON)
		add_theme_color_override("font_pressed_color",Color.CRIMSON)
		add_theme_color_override("font_focus_color",Color.CRIMSON)
		mostrando_aviso = true
		var alternative_text = "Not enough bounces"
		self.text = alternative_text
		await get_tree().create_timer(2.0).timeout
		remove_theme_color_override("font_color")
		remove_theme_color_override("font_hover_color")
		remove_theme_color_override("font_pressed_color")
		remove_theme_color_override("font_focus_color")
		mostrando_aviso = false
