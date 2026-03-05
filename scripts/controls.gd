extends Control


@onready var touch_controls: CanvasLayer = $TouchControls

func _ready() -> void:
	if OS.get_name() != "Android":
		touch_controls.hide()
