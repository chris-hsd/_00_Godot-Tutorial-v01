extends Node2D

@export var flame_scene: PackedScene = load("res://scenes/flame.tscn")
@export var num_flames: int = 20



func _ready():
	for i in range(num_flames): 
		var flame = flame_scene.instantiate()
		add_child(flame)
		flame.position = Vector2(
			randi_range(0, 150),
			randi_range(50, 100)
		)
