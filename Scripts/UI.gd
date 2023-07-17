extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$WeaponsLabel.text = "Weapons: " + str(Stats.Weapon)
	$ScoreLabel.text = "Score: "  + str(Stats.Score)
	$HealthLabel.text = "Health: " + str(Stats.Health)
	
	
