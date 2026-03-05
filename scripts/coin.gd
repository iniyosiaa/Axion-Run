extends Area2D

var alrmod = 0
@onready var game_manager: Node = $"../../GameManager"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var onmod: AudioStreamPlayer2D = $PickUpSound

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_point()
	gamestate.add_coin()
	animation_player.play("pickup")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("coin"):
		modcoin()
		
func modcoin():
		gamestate.coin = 40
		alrmod += 1
		if alrmod == 1:
			onmod.play()
			alrmod +=1
