extends Control

var eggs_collected: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.egg_collected.connect(_on_egg_collected)
	$CanvasLayer/EggCounter.text = "Eggs: 0"
	
func _on_egg_collected (body):
	$EggCollectedSound.play()
	eggs_collected += 1
	$CanvasLayer/EggCounter.text = "Eggs: %d" % eggs_collected
	
