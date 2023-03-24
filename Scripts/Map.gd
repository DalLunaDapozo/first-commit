extends Control

@onready var confiteria_icon : BaseButton = $Confiteria

func _ready():
	if(Global.cuenta_origen):
		confiteria_icon.visible = false

func _on_hostel_pressed():
	get_tree().change_scene_to_file("res://Scenes/test_gameplay.tscn")

func _on_confiteria_pressed():
	pass # Replace with function body.
