extends "res://scenes/Laser.gd"

func _ready():
	add_to_group("bullet")
	colliding_with_group = "enemy"