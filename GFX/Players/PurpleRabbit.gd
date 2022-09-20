extends KinematicBody2D


var motion = Vector2(0,0)
var up = Vector2(0,-1)
var countjump = 0
onready var move = $AnimatedSprite
onready var structure = $CollisionShape2D
onready var jumping = $Jumping_sound
onready var hurt = $Hurting_sound
const Speed = 500
const JumpSpeed = 1750
const Gravity = 100


func _physics_process(delta):
	move()
	jump()
	move_and_slide(motion,up)
	animate()
	add_gravity()



func add_gravity():
	if is_on_floor():
		motion.y = 0
		countjump = 0
	else:
		motion.y += Gravity


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -Speed
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = Speed
	else:
		motion.x = 0


func jump():
	if Input.is_action_just_pressed("jump") && countjump < 2:
		motion.y = -JumpSpeed
		countjump += 1
		jumping.play()


func animate():
	if motion.x > 0 :
		move.play("Walk")
		move.flip_h = false
	elif motion.x < 0 :
		move.play("Walk")
		move.flip_h = true
	elif motion.y != 0:
		move.play("Jump")
	else:
		move.play("Idle")



func damaged(var enemyposx):
	motion.y = -JumpSpeed * 0.7
	set_modulate(Color(1,0.3,0.3,0.3))
	##can't move when damaged
	Input.action_release("left")
	Input.action_release("right")
	Input.action_release("jump")
	hurt.play()
	structure.queue_free()
	$Timer.start()


func _on_Timer_timeout():
	set_modulate(Color(1,1,1,1))
	get_tree().change_scene("res://Scenes/Levels/Gameoverlv.tscn")


