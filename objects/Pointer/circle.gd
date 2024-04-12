extends Node2D
var parent_rotation #declaramos la variable para guardar el valor de la rotacion del personaje



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parent_rotation = get_parent().rotation #asignamos el valor de la rotacion del jugador a la variable
	set_rotation(- parent_rotation)
