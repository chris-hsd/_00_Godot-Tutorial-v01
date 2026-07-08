extends Node2D

@onready var ambient_birds: AudioStreamPlayer = $AmbientBirds
 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		# Bridge: Area2D signals → bus
	$ZoneDetector.body_entered.connect(_on_room_entered)
	$ZoneDetector.body_exited.connect(_on_room_exited)
	# This script also listens (to play birds)
	Events.zone_entered.connect(_on_zone_entered)
	Events.zone_exited.connect(_on_zone_exited)

  # --- Area2D → bus ---
func _on_room_entered(body: Node2D) -> void:
	Events.zone_entered.emit("forest", body)

func _on_room_exited(body: Node2D) -> void:
	Events.zone_exited.emit("forest", body)  

  # --- bus → birds ---
func _on_zone_entered(zone_name: String, body: Node2D) -> void:
		# entered the room (hall) → birds off	
	if body.name == "Girl" and ambient_birds.playing:
		ambient_birds.stop()

func _on_zone_exited(zone_name: String, body: Node2D) -> void:
		# left the room → in the forest → birds on
	if body.name == "Girl" and not ambient_birds.playing:
		ambient_birds.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
