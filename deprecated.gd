#func _shoot():
#	if hasItem: 
#		#obtenemos posision del apuntado
#		var pointer = $circle
#		var point = pointer.pointer
#		var target  = Vector2(point.global_position.x, point.global_position.y)
#		print (target)
#
#		if target == global_position:
#			return
#
#		#cargamos el item y lo disparamos
#		var formatPath = "res://objects/items/%s/%s.tscn"
#		var path = formatPath % [holdingItem, holdingItem]
#		var preloadItem = load(path)
#		var item = preloadItem.instantiate()
#		item.set_shoot(global_position, target)
#		get_parent().add_child(item)




	
	#if hasItem == true:
#		$Area2D.remove_from_group("getItem")
#		if Input.is_action_pressed("shootBtn_%s" % [playerID]):
#			var pointer = $circle
#			_shoot()
#			pointer.queue_free()
#			hasItem = false
#			$Area2D.add_to_group("getItem")
#
