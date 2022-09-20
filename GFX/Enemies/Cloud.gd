extends KinematicBody2D

onready var anim = $Animationupdown

func _ready():
	anim.play("UpDown")
