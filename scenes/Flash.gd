extends Sprite

func _ready():
	$Anim.play("fade_out")
	yield($Anim, "animation_finished")
	queue_free()
	