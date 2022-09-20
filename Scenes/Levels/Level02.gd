extends Node2D

var coin = 0

func _ready():
	$Player/ingame_song.play()


func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://Scenes/Levels/Gameoverlv.tscn")


func _on_Portal_body_entered(body):
	if coin == 5:
		get_tree().change_scene("res://Scenes/Levels/YouWin.tscn")
	else :
		get_tree().change_scene("res://Scenes/Levels/Gameoverlv.tscn")


func _on_coin_collect():
	coin += 1

