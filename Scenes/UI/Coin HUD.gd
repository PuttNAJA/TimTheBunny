extends CanvasLayer

var coin = 0
onready var number = $Coins

func _ready():
	number.text = String(coin)

func _on_coin_collect():
	coin = coin + 1 
	_ready()


func _on_Lv2coin_collect():
	coin = coin + 1 
	_ready()


