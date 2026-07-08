extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	print ('hi from house')
	$'../Label'.visible = true
	#Events.house_contacted.emit()

func _on_body_exited(_body: Node2D) -> void:
	print ('ciao')
	$'../Label'.visible = false
	
func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return
	if event is InputEventKey and event.keycode == KEY_SPACE and event.pressed:
		$'../Label'.visible = false
		Dialogic.start('haus_dialog')
		get_viewport().set_input_as_handled()
