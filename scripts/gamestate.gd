extends Node

var coin: int = 0
var timer: int = 0
var kurang: int
var target: int = 40

func count():
	timer += 1

func add_coin():
	coin += 1

func reset():
	coin = 0
	timer = 0
