extends Node

var cuenta_origen = false
var cuenta_sobre_confiteria = false

var can_leave = false

func _ready():
	Dialogic.signal_event.connect(self.dialogic_signal)

func dialogic_signal(argument):
	if(argument == "can_leave"):
		can_leave = true
	if(argument == "cuenta_origen"):
		cuenta_origen = true
	if(argument == "cuenta_sobre_confiteria"):
		cuenta_sobre_confiteria = true
