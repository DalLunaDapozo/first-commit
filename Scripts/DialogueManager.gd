extends Node

signal display_dialogue(dialogue_data)

func _ready():
	display_dialogue.connect(self.start_dialog)

func start_dialog(dialogue_data):
	Dialogic.start(dialogue_data)
	
