extends Path2D

@export var speed: int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var progress: float = 0
	$PathFollow2D.progress += speed * delta
