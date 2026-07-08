extends Area2D

@onready var panel = $"../PanelContainer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	panel.visible = false
	body_entered.connect(_on_house_contacted)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_house_contacted(_body: Node2D): 
	Events.house_contacted.emit()
	print ('hi from house') 
	panel.visible = true 
 
func _on_body_exited(_body: Node2D) -> void:
	panel.visible = false 
	print ('ciao')
