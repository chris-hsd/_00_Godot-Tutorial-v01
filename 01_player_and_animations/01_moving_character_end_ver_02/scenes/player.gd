extends CharacterBody2D
@export var SPEED:float = 150

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame
# "ui-right" erfordert kein Key Mapping (input) für die Avatar Steuerung 
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("ui_right"):
		#position.x += SPEED * delta
		#$AnimatedSprite2D.play('right')
	#if Input.is_action_pressed("ui_left"):
		#position.x -= SPEED * delta
		#$AnimatedSprite2D.play('left')
	#if Input.is_action_pressed("ui_down"):
		#position.y += SPEED * delta
		#$AnimatedSprite2D.play('down')
	#if Input.is_action_pressed("ui_up"):
		#position.y -= SPEED * delta
		#$AnimatedSprite2D.play('up')

func _process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

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
		
		
