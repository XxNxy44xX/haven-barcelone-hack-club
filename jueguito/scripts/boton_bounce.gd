extends Button

var default_text = "Upgrade Bounce: "
var bounce_cost = 5
var mostrando_aviso = false
var x = float(2)

func _process(delta):
	if Global.rebirth:
		print("Hi")
		bounce_cost = 5
		x=float(2)
		
	if not mostrando_aviso:
		var bounce_text = str(default_text, str(Global.upgrade_bounce), "\n", "Bounce: ", str(snapped(Global.bounce_meter,0.01)))
		self.text = bounce_text
		
func _on_pressed() -> void:
	if Global.upgrade_bounce <= Global.bounce_counter:
		Global.bounce_counter -= Global.upgrade_bounce
		Global.upgrade_bounce = Global.upgrade_bounce * 2
		Global.bounce_meter = float(1 - 1/x)
		x +=1
		
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
