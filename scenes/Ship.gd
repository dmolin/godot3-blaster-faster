extends Area2D

var screensize
var sprite_half_size
var SCN_LASER = preload("res://scenes/LaserShip.tscn")
var SCN_EXPLOSION = preload("res://scenes/Explosion.tscn")
var SCN_FLASH = preload("res://scenes/Flash.tscn")
var shooting = false
var armor = 4 setget set_armor

signal armor_changed

func _ready():
	screensize = get_viewport_rect().size
	sprite_half_size = $sprite.texture.get_size().x / 2
	add_to_group("ship")

func _process(delta):
	var motion = (utils.mouse_pos.x - position.x) * .2
	# self.position.x += motion
	translate(Vector2(motion, 0))
	
	# clamp if out of boundaries
	position.x = clamp(position.x, 0 + sprite_half_size, screensize.x - sprite_half_size)
	
	# detect input
	if Input.is_action_pressed("ui_accept"):
		if shooting:
			return
		
		shooting = true
		shoot()
		# throttle to max 10 laser beams per second
		yield(utils.create_timer(0.10), "timeout")
		shooting = false
		
func shoot():
	var pos_left = get_node("cannons/left").global_position
	var pos_right = get_node("cannons/right").global_position
	# create both lasers
	create_laser(pos_left)
	create_laser(pos_right)
	
func create_laser(pos):
	var laser = SCN_LASER.instance()
	laser.position = pos
	utils.main_node.add_child(laser)
	
func create_explosion():
	var explosion = SCN_EXPLOSION.instance()
	explosion.position = position
	utils.main_node.add_child(explosion)
	
func set_armor(new_value):
	if new_value < armor:
		utils.main_node.add_child(SCN_FLASH.instance()) 
	armor = new_value
	emit_signal("armor_changed", armor)
	if armor <= 0:
		create_explosion()
		queue_free()
		
func _on_Ship_area_entered( area ):
	if area.is_in_group("enemy"):
		self.armor -= 2
					