extends Node

var score = 0

@onready var score_label: Label = $ScoreLabel
@onready var portal_coin: Label = $PortalCoin
@onready var coin: Label = $"../HUD/Control/VBoxContainer/Coin/Label"

func _process(delta: float) -> void:
	coin.text = str(gamestate.coin)
	if gamestate.coin >= gamestate.target:
		portal_coin.text = "Press E To Interact"
	else:
		gamestate.kurang = gamestate.target - gamestate.coin
		print(gamestate.kurang)
		portal_coin.text = "You Need " + str(gamestate.kurang) + " More Coins"

func add_point():
	score += 1
	print(score)

func add_coin():
	gamestate.coin += 1
	coin.text = str(gamestate.coin)
	
	
