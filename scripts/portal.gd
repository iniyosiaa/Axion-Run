extends StaticBody2D

@onready var interactable: Area2D = $Interactable
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var activate: AudioStreamPlayer2D = $OpenPortal

func _ready() -> void:
	interactable.interact = _on_interact
	
func _on_interact():
	if gamestate.coin == gamestate.target:
		interactable.is_interactable = false
		activate.play()
		sprite_2d.play("active")
		await get_tree().create_timer(1.0).timeout
		sprite_2d.play("open")
		await get_tree().create_timer(3.0).timeout
		call_deferred("_change_scene")
	else :
		interactable.is_interactable = true
		sprite_2d.play("close")
	
func _change_scene():
	get_tree().change_scene_to_file("res://scenes/end.tscn")
