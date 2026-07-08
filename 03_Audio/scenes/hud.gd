extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/CheckButton.pressed.connect(_on_check_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_check_button_pressed() -> void:
	get_tree().paused = !get_tree().paused
	$ButtonSound.play()
	$CanvasLayer/CheckButton.text = "▶" if get_tree().paused else "⏸"
