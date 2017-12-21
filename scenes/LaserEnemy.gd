extends "res://scenes/Laser.gd"

func _ready():
	add_to_group("enemy_bullet")
	colliding_with_group = "ship"