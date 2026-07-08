extends CharacterBody2D

@export var SPEED:float = 150
		
var heal: float = 0.0
var damage: float = 0.0
var total_health: float = 100.0
var was_moving := false
var steps: AudioStreamPlayer2D

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.tile_effect.connect(_on_tile_effect)
	$AnimatedSprite2D.frame_changed.connect(_on_frame_changed)
	Events.zone_entered.connect(_on_zone_entered)
	Events.zone_exited.connect(_on_zone_exited)

	
func _on_zone_entered(zone_name: String, body: Node2D) -> void:
		# entered the room (hall) → birds off	
	if body.name == "Girl":
		$EpicSound.stop()
		steps = $StepSound
		_set_steps_reverb(true)


func _on_zone_exited(zone_name: String, body: Node2D) -> void:
		# left the room → in the forest → birds on
	if body.name == "Girl":
		$EpicSound.play()
		steps=$GreenStepSound
		_set_steps_reverb(false)

# Audio Bus Effekte lassen sich per Klasse AudioServer steuern 
# set_bus_effect_enabled (bus_idx, effect_idx, enabled)

func _set_steps_reverb(enabled: bool) -> void:
	var bus_idx := AudioServer.get_bus_index("Steps")
	# Reverb ist auf deinem Bus der zweite Effekt -> Index 1
	# (LowPassFilter = 0, Reverb = 1, gezählt von oben)
	AudioServer.set_bus_effect_enabled(bus_idx, 1, enabled)

func _on_frame_changed() -> void:
	var anim = $AnimatedSprite2D.animation
	var frame = $AnimatedSprite2D.frame
	
	# nur bei Laufanimationen, nicht bei "idle"
	if anim == "idle":
		return
	# Sound z.B. bei Frame 0 und 2 (z.B.2 wenn Fuß aufsetzt)
	if frame in [1,2,3,4,5,6]:
		steps.play()

func _on_tile_effect(damage: float, heal: float, total_steps: int) -> void:
	total_health = total_health - damage + heal
	Events.stats_changed.emit (total_health, total_steps)

func _physics_process(delta: float) -> void:
	Events.player_moved.emit(global_position) #Pixelposition im Vieport 
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var is_moving :bool= direction != Vector2.ZERO
	velocity = direction * SPEED
	
	# Erster Schritt sofort beim Loslaufen
	if is_moving and not was_moving:
		steps.play()
	was_moving = is_moving
 
	if direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	elif direction.x > 0:
		$AnimatedSprite2D.play("right")
	elif direction.x < 0:
		$AnimatedSprite2D.play("left")
	elif direction.y > 0:
		$AnimatedSprite2D.play("down")
	elif direction.y < 0:
		$AnimatedSprite2D.play("up")

	move_and_slide()
		
		
