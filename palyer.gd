extends CharacterBody2D

const FAST_FALL_SPEED = 1000
const SPEED = 300.0
const JUMP_VELOCITY = -600.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anima = get_node("AnimationPlayer")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += (gravity * 2) * delta
		if velocity.y > 0:
			
			self.set_rotation(deg_to_rad(velocity.y  * -0.09))
			
			

	# Handle Jump.
	if Input.is_action_just_pressed("neutralJump"):
		velocity.x = 0
		velocity.y = JUMP_VELOCITY
		self.set_rotation(PI/8)

	if Input.is_action_just_pressed("leftJump"):
		velocity.x = -1 * SPEED
		velocity.y = JUMP_VELOCITY
		self.set_rotation(PI/8)

	if Input.is_action_just_pressed("rightJump"):
		velocity.x = SPEED
		velocity.y = JUMP_VELOCITY
		self.set_rotation(PI/8)

	
	
	move_and_slide()

	#---------------FAST FALL CODE (Descartado para que sea un item o elevador in game------------
#	if Input.is_action_pressed("fastFall"):
#		velocity.x = 0
#		velocity.y = FAST_FALL_SPEED
#
#	if Input.is_action_just_released("fastFall"):
#		velocity.x = 0
#		velocity.y = gravity * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	
