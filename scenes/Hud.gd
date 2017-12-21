extends CanvasLayer


func _on_BtnStart_pressed():
	get_tree().change_scene("res://stages/World.tscn")


func _on_BrnQuit_pressed():
	get_tree().quit()
