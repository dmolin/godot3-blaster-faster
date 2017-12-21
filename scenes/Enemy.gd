extends Area2D

export var velocity = Vector2()
export var armor = 2 setget set_armor

var screensize
var half_this_node = 16
var SCN_EXPLOSION = preload("res://scenes/Explosion.tscn")

func _ready():
	screensize = get_viewport_rect().size
	half_this_node = $sprite.texture.get_size().x / 2
	add_to_group("enemy")

func _process(delta):
	translate(velocity * delta)
	if self.position.y >= screensize.y + half_this_node:
		queue_free()
		
func set_armor(new_value):
	if is_queued_for_deletion(): return
	armor = new_value
	if armor <= 0:
		create_explosion() 
		queue_free()
		get_tree().call_group("HUD", "_on_enemy_dead")	


func create_explosion():
	var explosion = SCN_EXPLOSION.instance()
	explosion.position = position
	utils.main_node.add_child(explosion)

func _on_Enemy_area_entered( area ):
	if area.is_in_group("ship"):
		# bring the armor down to zero
		self.armor = 0
		