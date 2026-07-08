extends CharacterBody2D

@export var radius := 100.0   # max. Abstand vom Startpunkt
@export var speed := 40.0     # Pixel pro Sekunde

var _dir: Vector2

var _dodge := 0.0
var _dodge_timer := 0.0

func _ready() -> void:
	modulate = Color.RED 

func _physics_process(delta: float) -> void:
	var player := get_tree().get_first_node_in_group("player")
	_dodge_timer -= delta

	if player and position.distance_to(player.position) < 50.0:
		# FLIEHEN: weg vom Player, mit Haken
		if _dodge_timer <= 0.0:
			_dodge = randf_range(-1.2, 1.2)
			_dodge_timer = randf_range(0.3, 0.7)
		_dir = (position - player.position).normalized().rotated(_dodge)
	else:
		# WANDERN: alle 0.5–1.2 s neue Zufallsrichtung
		if _dodge_timer <= 0.0:
			_dir = Vector2.RIGHT.rotated(randf() * TAU)
			_dodge_timer = randf_range(0.5, 1.2)
	velocity = _dir * speed
	move_and_slide()
		
 
