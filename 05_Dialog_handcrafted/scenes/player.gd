extends CharacterBody2D

@export var SPEED:float = 150
		
var heal: float = 0.0
var damage: float = 0.0
var total_health: float = 100.0
var was_moving := false
var steps: AudioStreamPlayer2D

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.frame_changed.connect(_on_frame_changed)
	steps = $GreenStepSound
	$PanelContainer.visible = false
	Events.house_contacted.connect(_on_house_contacted)

func _on_frame_changed() -> void:
	var anim = $AnimatedSprite2D.animation
	var frame = $AnimatedSprite2D.frame
	# nur bei Laufanimationen, nicht bei "idle"
	if anim == "idle":
		return
	# Sound z.B. bei Frame 0 und 2 (z.B.2 wenn Fuß aufsetzt)
	if frame in [1,2,3,4,5,6]:
		steps.play()
		
func _on_house_contacted (): 
	$PanelContainer.visible = true
	print ('hi from player')
	print ('Wie oft war ich schon vor dem Haus:', str(Data.dialog_counter()))

func _set_steps_reverb(enabled: bool) -> void:
	var bus_idx := AudioServer.get_bus_index("Steps")
	# Reverb ist auf deinem Bus der zweite Effekt -> Index 1
	# (LowPassFilter = 0, Reverb = 1, gezählt von oben)
	AudioServer.set_bus_effect_enabled(bus_idx, 1, enabled)


func _physics_process(_delta: float) -> void:
	
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
		
		
