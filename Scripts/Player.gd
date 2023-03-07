extends CharacterBody3D

@onready var _animation_player : AnimationPlayer = $AnimationPlayer
@onready var _sprite : Sprite3D = $Sprite3D

@export var SPEED = 1.0

var is_moving := false

func _physics_process(_delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_right","move_left","move_down", "move_up")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	if(velocity.x > 0):
		_sprite.flip_h = false
	elif(velocity.x < 0):
		_sprite.flip_h = true
	
	if(direction != Vector3.ZERO):
		is_moving = true
	else:
		is_moving = false
	
	if(is_moving):
		_animation_player.play("walk")
	else:
		_animation_player.play("idle")
	
	move_and_slide()

