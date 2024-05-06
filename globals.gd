extends Node

var items: Array[String] = [
	"pipe",
	"bounceBall", 
	"fireTank", 
	"shockWave"
	]


func get_item():
	return items.pick_random()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
