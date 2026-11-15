extends RigidBody2D

var grabbed = false
var offset = Vector2(0,0)

func _process(_delta):
	if grabbed:
		position = get_global_mouse_position() - offset 
	self.physics_material_override.bounce = Global.bounce_meter


func _on_button_button_down():
	grabbed = true
	offset = get_global_mouse_position() - global_position

func _on_button_button_up():
	grabbed = false
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Suelo"):
		count_bounce(Global.bounce_counter + Global.increase_multiplier)


func count_bounce(new_count_bounce: int) -> void:
	Global.bounce_counter = new_count_bounce
	
