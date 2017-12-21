extends Node

var enemies = [
	preload("res://scenes/EnemyKamikaze.tscn"),
	preload("res://scenes/EnemyClever.tscn")
]

var sprite_half_size = 16
var screensize

func _ready():
	screensize = utils.view_size
	spawn()

func spawn():
	while true:
		randomize()
		var enemy = utils.choose(enemies).instance()
		enemy.velocity = enemy.velocity * rand_range(0.70, 1)
		var pos = Vector2()
		pos.x = rand_range(0 + sprite_half_size, screensize.x - sprite_half_size)
		pos.y = -1 * (sprite_half_size * 2)
		enemy.translate(pos)
		get_node("container").add_child(enemy)
		yield(utils.create_timer(rand_range(0.5, 1.25)), "timeout")