extends CharacterBody2D

@export var SPEED:float = 150
		
var was_moving := false
var steps: AudioStreamPlayer2D

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame_changed.connect(_on_frame_changed)
	steps = $GreenStepSound
	add_to_group("player")
	

func _on_frame_changed() -> void:
	var anim = $AnimatedSprite2D.animation
	var frame = $AnimatedSprite2D.frame
	# nur bei Laufanimationen, nicht bei "idle"
	if anim == "idle":
		return
	# Sound z.B. bei Frame 0 und 2 (z.B.2 wenn Fuß aufsetzt)
	if frame in [1,2,3,4,5,6]:
		steps.play()
		

func _set_steps_reverb(enabled: bool) -> void:
	var bus_idx := AudioServer.get_bus_index("Steps")
	# Reverb ist auf deinem Bus der zweite Effekt -> Index 1
	# (LowPassFilter = 0, Reverb = 1, gezählt von oben)
	AudioServer.set_bus_effect_enabled(bus_idx, 1, enabled)


func _physics_process(delta: float) -> void:
	
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
		
		
