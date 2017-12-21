extends Sprite

func _ready():
	$Player.play("explode")
	utils.remote_call("Camera", "shake", 8, 0.2)

func _on_Player_animation_finished( name ):
	queue_free()
