extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(body):
	print("Collision detected with:", body)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_3d_body_entered(body):
	var x = (body as Node3D).get_parent_node_3d().transform.origin.x
	#if body.name == "Player":
	if x>0:
		print("Right")
	if x<0:
		print("Left")
	print("collide")




