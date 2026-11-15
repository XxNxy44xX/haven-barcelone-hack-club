extends Node2D

var bounce_counter = -1
var increase_multiplier = 1
var bounce_meter = float(0)

var upgrade_bounce = 5

var rebirth = false

func _process(delta):
	if rebirth:
		bounce_counter = 0
		bounce_meter = float(0)
		upgrade_bounce = 5
		rebirth = false
