extends Node2D
var parent_rotation #declaramos la variable para guardar el valor de la rotacion del personaje
@onready var pointer = $pointer/Sprite2D
@onready var circle = $Sprite2D
@onready var radio = $collition.shape.radius
@onready var point = pointer.global_position
var control = false
var savedPos : Vector2

 # guarda la posicion del pointer cuando jugamos con control

func _input(event):
	if event is InputEventKey:
		#pointer.global_position = get_global_mouse_position()
		control = false
	#else:	
	elif event is InputEventJoypadButton:
		#var aim_dir = Vector2(Input.get_axis("aimLeft", "aimRight"), Input.get_axis("aimUp", "aimDown")) 
		#pointer.global_position = aim_dir
		control = true
		
		########## TODO: Hacer que el stick derecho Funcione correctamente en el apuntado (Y que no se devuelva a 0,0)
		
		
		
func _process(delta):
	
	var player = get_parent().playerID
	parent_rotation = get_parent().rotation #asignamos el valor de la rotacion del jugador a la variable
	set_rotation(- parent_rotation)
	
	if control == false and player == 1:
		pointer.visible = true
		pointer.global_position = get_global_mouse_position()
		pointer.position = circle.position + (pointer.position - circle.position).limit_length(radio)
	elif control == true:
		
		var aim_dir = Vector2(Input.get_axis("aimLeft_%s"  % [player], "aimRight_%s" % [player]), Input.get_axis("aimUp_%s"  % [player], "aimDown_%s" % [player]))
		pointer.position = aim_dir * (radio * 2)
		pointer.position = circle.position + (pointer.position - circle.position).limit_length(radio)
		#print(aim_dir)
#
#		if aim_dir.x != 0 or aim_dir.y != 0:
#			savedPos = aim_dir
#		elif aim_dir.x == 0 and aim_dir.y == 0:
#			aim_dir =  savedPos
#
#		pointer.position = aim_dir * radio

		if control == true and aim_dir.x == 0 and aim_dir.y == 0:
			pointer.visible = false
		else: 
			pointer.visible = true
		
			
			
			
		#pointer.position = circle.position + (pointer.position - circle.position).limit_length(radio)
		#print("usnado control")
#	pointer.global_position = get_global_mouse_position()
#	pointer.position = circle.position + (pointer.position - circle.position).limit_length(radio)


		
