extends Node2D

var d = 0.0
var radius =250 
var speed = 10.0
var parent_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if get_global_mouse_position().x > global_position.x:
		
		#d += delta
		#position = Vector2(
			#sin(d * speed) * radius,
			#cos(d * speed) * radius 
		#) 
	#elif get_global_mouse_position().x < global_position.x:
		#d -= delta
		#position = Vector2(
			#sin(d * speed) * radius,
			#cos(d * speed) * radius 
		#) 
		
		
	if Input.is_action_pressed("ui_up"):
		
		d += delta
		position = Vector2(
			sin(d * speed) * radius,
			cos(d * speed) * radius 
		) 
	if Input.is_action_pressed("ui_down"):
		
		d -= delta
		position = Vector2(
			sin(d * speed) * radius,
			cos(d * speed) * radius 
		) 
