extends Control


func _ready():
	pass


func _on_Mainmenu_pressed():
	get_tree().change_scene("res://Scenes/Levels/Titlegame.tscn")


func _on_Play_again_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level02.tscn")
