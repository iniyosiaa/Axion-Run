extends Control
class_name StopwatchHUD

@onready var stopwatch_label: Label = $StopwatchLabel

var stopwatch : Stopwatch

func _ready():
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	
func _process(delta: float) -> void:
	update_stopwatch_label()
	
func update_stopwatch_label():
	stopwatch_label.text = stopwatch.time_to_string()
