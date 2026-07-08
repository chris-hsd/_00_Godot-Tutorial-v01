extends CharacterBody2D

@export var radius := 100.0   # max. Abstand vom Startpunkt
@export var speed := 60.0     # Pixel pro Sekunde

var _home: Vector2

func _ready() -> void:
	_home = position
	_move_next() 

		
func _move_next() -> void:
	var target := _home + Vector2(randf_range(-radius, radius), randf_range(-radius, radius))
	var duration := position.distance_to(target) / speed*0.5
	var tween := create_tween()
	tween.tween_property(self, "position", target, duration)
	tween.finished.connect(_move_next)
