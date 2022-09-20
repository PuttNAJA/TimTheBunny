extends KinematicBody2D

var motion = Vector2()
var speed = 90
onready var move = $walking
onready var check = $Floorcheck
onready var collision = $CollisionShape2D
onready var top = $Top_checker
onready var side = $Side_cheker
export var direction = 1
export var detect_cliffs = true

func _ready():
	if direction == -1:
		move.flip_h = true
	check.position.x = collision.shape.get_extents().x * direction
	check.enabled = detect_cliffs


func _physics_process(delta):
	if is_on_wall() or not check.is_colliding() and detect_cliffs and is_on_floor():
		direction = direction * -1
		move.flip_h = not move.flip_h
		check.position.x = collision.shape.get_extents().x * direction
	
	
	motion.y += 20
	motion.x = speed * direction
	
	motion = move_and_slide(motion,Vector2.UP)


func _on_Side_cheker_body_entered(body):
	move.play("die")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	side.set_collision_layer_bit(4,false)
	side.set_collision_mask_bit(0,false)
	top.set_collision_layer_bit(4,false)
	top.set_collision_mask_bit(0,false)
	$AnimationEnemy.play("dead")


func _on_Top_checker_body_entered(body):
	body.damaged(position.x)
	


func _on_AnimationEnemy_animation_finished(anim_name):
	queue_free()
