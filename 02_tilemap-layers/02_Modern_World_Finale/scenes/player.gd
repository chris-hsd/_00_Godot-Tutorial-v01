extends CharacterBody2D

@export var SPEED:float = 150
		
var heal: float = 0.0
var damage: float = 0.0
var total_health: float = 100.0
var was_moving := false

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.tile_effect.connect(_on_tile_effect)
	$AnimatedSprite2D.frame_changed.connect(_on_frame_changed)
	
func _on_frame_changed() -> void:
	var anim = $AnimatedSprite2D.animation
	var frame = $AnimatedSprite2D.frame
	
	# nur bei Laufanimationen, nicht bei "idle"
	if anim == "idle":
		return
	# Sound z.B. bei Frame 0 und 2 (z.B.2 wenn Fuß aufsetzt)
	if frame in [1,2,3,4,5,6]:
		$StepSound.play()

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
		$StepSound.play()
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
		
		
