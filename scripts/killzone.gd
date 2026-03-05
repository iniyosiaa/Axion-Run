extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	print("You died!") 
	gamestate.coin = 0
	#Engine.time_scale = 0.8
	#print("node:", get_node("%GameOver"))
	#if(get_node("%GameOver")):
	body.get_node("CollisionShape2D").queue_free()
	get_tree().root.get_node("Game/GameOver").game_over()
	#else:
		#get_tree().reload_current_scene()
	#timer.start() 
	

#func _on_timer_timeout() -> void:
	#Engine.time_scale = 1.0
	##get_tree().reload_current_scene()
	#if(get_node("../GameOver")):
		#get_node("../GameOver").game_over()
	#else:
		#get_tree().reload_current_scene()
