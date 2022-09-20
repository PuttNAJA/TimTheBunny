extends Area2D

signal coin_collect

func _on_coin_body_entered(body):
	$Gone_animation.play("gone")
	$pick.play()
	emit_signal("coin_collect")
	set_collision_mask_bit(0,false)


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

