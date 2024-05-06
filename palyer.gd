extends CharacterBody2D

const deathPath = preload("res://objects/particles/player/player_death.tscn")
@export var playerID : = 1
const FAST_FALL_SPEED = 1000
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var hasItem : bool
@onready var pointerPath = preload("res://objects/Pointer/pointer.tscn")
@onready var sprite = $AnimatedSprite2D
@export var holdingItem: String
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anima = get_node("AnimationPlayer")

func _ready():
	if playerID == 1:
		sprite.play("p1")
	elif playerID == 2:
		sprite.play("p2")
	elif playerID == 3:
		sprite.play("p3")	
	elif playerID == 4:
		sprite.play("p4")
		
		
func _physics_process(delta):
	
#	if is_on_floor() or is_on_wall() or is_on_ceiling():
#		velocity.x = 0
#		_death()
		
	# Add the gravity.
	if !is_on_floor():
		velocity.y += (gravity * 2) * delta
		if velocity.y > 0:
			
			self.set_rotation(deg_to_rad(velocity.y  * -0.09))
			
			

	# Handle Jump.
	if Input.is_action_just_pressed("neutralJump_%s" % [playerID]):
		velocity.x = 0
		velocity.y = JUMP_VELOCITY
		self.set_rotation(PI/8)

	if Input.is_action_just_pressed("leftJump_%s" % [playerID]):
		velocity.x = -1 * SPEED
		velocity.y = JUMP_VELOCITY
		self.set_rotation(PI/8)

	if Input.is_action_just_pressed("rightJump_%s" % [playerID]):
		velocity.x = SPEED
		velocity.y = JUMP_VELOCITY
		self.set_rotation(PI/8)
	
	if hasItem == true:
		_shoot()

	move_and_slide()

	#---------------FAST FALL CODE (Descartado para que sea un item o elevador in game------------
#	if Input.is_action_pressed("fastFall"):
#		velocity.x = 0
#		velocity.y = FAST_FALL_SPEEDw
#
#	if Input.is_action_just_released("fastFall"):
#		velocity.x = 0
#		velocity.y = gravity * delta
	

func _on_area_2d_area_entered(area):
	if area.is_in_group("ItemBox") and hasItem == false:
		hasItem = true
		holdingItem = Globals.get_item()
		var pointer = pointerPath.instantiate()
		self.add_child(pointer)
	if area.is_in_group("deathWall"):
		_death()
	

func _shoot():
	if hasItem == true:
		#Si ya tiene item no puede interacuar con las cajas
		$Area2D.remove_from_group("getItem")
		if Input.is_action_pressed("shootBtn_%s" % [playerID]): 
		#obtenemos posision del apuntado
			var pointer = $circle
			var point = pointer.pointer #Aqui accedemos a la mira (La bolita con la que apunta el circulo)
			var target  = Vector2(point.global_position.x, point.global_position.y)

			if target == global_position:
				return
			else:
				#cargamos el item y lo disparamos
				var formatPath = "res://objects/items/%s/%s.tscn"
				var path = formatPath % [holdingItem, holdingItem]
				var preloadItem = load(path)
				var item = preloadItem.instantiate()
				item.set_shoot(global_position, target)
				get_parent().add_child(item)
				pointer.queue_free()
				hasItem = false
				$Area2D.add_to_group("getItem")


func _death():
	velocity.x = 0
	var death = deathPath.instantiate()
	self.add_child(death)
	$player_death.emitting = true
	
