extends Area2D

export var velocity = Vector2()
const SCN_FLARE = preload("res://scenes/Flare.tscn")
const colliding_with_group = "enemy"

func _ready():
	create_flare()

func _process(delta):
	translate(velocity * delta)
	
func create_flare():
	var flare = SCN_FLARE.instance()
	flare.position = position
	utils.main_node.add_child(flare)

func _on_VisibilityNotifier_screen_exited():
	queue_free()

func _on_Laser_area_entered( area ):
	if area.is_in_group(colliding_with_group):
		# area.armor -= 1
		create_flare()
		utils.remote_call("Camera", "shake", 1, .13)
		queue_free()   
