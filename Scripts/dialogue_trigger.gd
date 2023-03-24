extends Area3D

@onready var exclamation : Sprite3D = $Exclamation
@export var dialogue_data : String
@export var dialogue_data_loop : String

var area_active = false
var on_dialogue = false

func _ready(): 
	Dialogic.timeline_ended.connect(self._on_after_dialogue)
	exclamation.visible = false

func _input(event):
	if area_active and event.is_action_pressed("action") and !on_dialogue:
		if(Global.can_leave):
			DialogueManager.emit_signal("display_dialogue", dialogue_data_loop)
			on_dialogue = true
		else:
			DialogueManager.emit_signal("display_dialogue", dialogue_data)
			on_dialogue = true
			
func _on_area_entered(_area):
	area_active = true
	exclamation.visible = true

func _on_area_exited(_area):
	area_active = false
	exclamation.visible = false

func _on_after_dialogue():
	print("DIALOGO TERMINADO")
	on_dialogue = false
