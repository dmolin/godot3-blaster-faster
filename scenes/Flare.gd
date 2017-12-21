extends Sprite


func _ready():
	get_node("Anim").play("fade_out")
	# alternative to use the callback function:
	#yield(get_node("Anim"), "animation_finished")
	#queue_free()

func _on_Anim_animation_finished( name ):
	queue_free()
