extends CanvasLayer

@onready var game_over_sfx: AudioStreamPlayer2D = $GameOverSFX
@onready var hud = $"../HUD"

func _ready() -> void:
	self.hide()

func game_over():
	get_tree().paused = true
	hud.visible = false
	game_over_sfx.play()
	self.show()


func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
