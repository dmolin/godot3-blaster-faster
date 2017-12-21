extends "res://scenes/Enemy.gd"

var SCN_LASER = preload("res://scenes/LaserEnemy.tscn")

func _ready():
	velocity.x = utils.choose([velocity.x, -velocity.x])
	yield(utils.create_timer(1), "timeout")
	shoot()

func _process(delta):
	if position.x <= half_this_node:
		velocity.x = abs(velocity.x)
	if position.x > screensize.x - half_this_node:
		velocity.x = -abs(velocity.x)

func shoot():
	while true:
		var laser = SCN_LASER.instance()
		laser.position = get_node("cannon").global_position
		utils.main_node.add_child(laser)
		yield(utils.create_timer(1.25), "timeout")