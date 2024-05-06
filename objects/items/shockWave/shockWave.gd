extends Area2D

const shoot_speed = 400
var direction : Vector2

func set_shoot(position, targetPosition):
	global_position = position
	direction = (targetPosition - position).normalized()
	rotation_degrees =  rad_to_deg(position.angle_to_point(targetPosition))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#rotation = rotation + 20 * delta
	position += direction * shoot_speed * delta


func _on_area_entered(area):
	if area.is_in_group("deathWall"):
		self.queue_free() 
