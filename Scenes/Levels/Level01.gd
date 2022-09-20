extends Node2D


func _ready():
	$Player/ingame_song.play()


func _on_coin_collect():
	$delay.start()


func _on_delay_timeout():
	get_tree().change_scene("res://Scenes/Levels/Level02.tscn")


func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://Scenes/Levels/Gameover.tscn")
