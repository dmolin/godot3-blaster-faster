extends Sprite

export var velocity = Vector2()
var screensize

func _ready():
	screensize = get_viewport_rect().size

func _process(delta):
	translate(velocity * delta)
	if self.position.y >= screensize.y:
		self.position.y = -180
		