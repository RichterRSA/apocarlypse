extends Node3D

var chosen = Chosen.Weapon
var left
var right

# Called when the node enters the scene tree for the first time.
func _ready():
	# Prints a random floating-point number from a normal distribution with a mean 0.0 and deviation 1.0.
	var random = RandomNumberGenerator.new()
	random.randomize()
	var ran = random.randf_range(0.0,1.0)
	if ran < 0.5:
		choose_weapons()
	elif ran > 0.5:
		choose_health()

func choose_weapons():
	$ChoiceLabel.text = "Weapons"
	chosen = Chosen.Weapon

func choose_health():
	$ChoiceLabel.text = "Health"
	chosen = Chosen.Health
	var random = RandomNumberGenerator.new()
	random.randomize()
	left = random.randi_range(-10,10)*10
	right = random.randi_range(-10,10)*10




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_3d_body_entered(body):
	var x = (body as Node3D).get_parent_node_3d().transform.origin.x

	if x>0:
		print("Right")
		if chosen==Chosen.Health:
			Stats.Health+=right
	if x<0:
		print("Left")
		if chosen==Chosen.Health:
			Stats.Health+=left
	print("collide")
	queue_free() 
	
enum Chosen{
	Health,
	Weapon
}


