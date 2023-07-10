extends Node3D

const MAX_HORIZONTAL_DISTANCE = 0.6
const CAR_MOVE_SENSITIVITY = 1.0
const CAR_SPEED = 1.0

var Car: Node3D
var CarTarget: Node3D
var input_delta: float = 0.0
var car_x: float
var lane: float = -1.0
var can_change_lanes = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Car = get_node("Car")
	CarTarget = get_node("CarTarget")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abs(input_delta)>10:
		lane = sign(input_delta)
		CarTarget.transform.origin.x = lane * MAX_HORIZONTAL_DISTANCE
		Car.transform.origin.x = lane * MAX_HORIZONTAL_DISTANCE
		input_delta = 0
		
	
	Car.get_parent().translate(Vector3.FORWARD*CAR_SPEED*delta)


func _input(event):
	var mouse = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	
	if event is InputEventMouseMotion:
		var rel = event.relative.x
		if mouse:
			input_delta += rel
		
