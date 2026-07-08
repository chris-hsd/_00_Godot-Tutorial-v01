extends CharacterBody2D

const SPEED = 100

func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	move_and_slide()

	if direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	elif direction.x > 0:
		$AnimatedSprite2D.play("rechts")
	elif direction.x < 0:
		$AnimatedSprite2D.play("links")
	elif direction.y > 0:
		$AnimatedSprite2D.play("runter")
	elif direction.y < 0:
		$AnimatedSprite2D.play("hoch")
