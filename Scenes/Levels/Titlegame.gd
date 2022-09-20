extends Control


func _ready():
	pass


func _on_Playbutton_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level01.tscn")


func _on_Quitbutton_pressed():
	get_tree().quit()
