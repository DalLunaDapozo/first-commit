extends StaticBody3D

@onready var _outline : MeshInstance3D = $outline

var player_near := false

func _ready():
	_outline.visible = false

func _process(_delta):
	if(Input.is_action_just_pressed("action") and player_near):
		get_tree().change_scene_to_file("res://Scenes/Map.tscn")
	

func _on_area_3d_body_entered(_body):
	if(Global.can_leave):
		_outline.visible = true
		player_near = true

func _on_area_3d_body_exited(_body):
	_outline.visible = false
	player_near = false
