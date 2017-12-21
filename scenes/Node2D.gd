extends Node2D

export var velocity = Vector2()
var screensize
var tot_height = 180 * 3

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	translate(Vector2(velocity.x, velocity.y + delta))
	if self.position.y >= screensize.y:
		self.position.y = -tot_height