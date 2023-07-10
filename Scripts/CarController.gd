extends Node3D

const ABOUT_SENSITIVITY = 0.0025
const MAX_HORIZONTAL_DISTANCE = 0.5
const CAR_MOVE_SENSITIVITY = 40
const CAR_SPEED = 5.0
const CAR_LANE_CHANGE_SPEED = 10.0

var Car: Node3D
var CarTarget: Node3D
var input_delta: float = 0.0
var car_x: float
var lane: float = -1.0
var can_move = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Car = get_node("Car")
	CarTarget = get_node("CarTarget")
	car_x = lane * MAX_HORIZONTAL_DISTANCE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if abs(input_delta)>CAR_MOVE_SENSITIVITY and can_move:
		lane = sign(input_delta)
		CarTarget.transform.origin.x = lane * MAX_HORIZONTAL_DISTANCE
		input_delta = 0
		can_move = false
	
	handle_car_horizontal(delta)
	
	Car.get_parent().translate(Vector3.FORWARD*CAR_SPEED*delta)

func handle_car_horizontal(delta):	
	if about(0.05):
		can_move = true
	car_x = lerp(car_x, lane * MAX_HORIZONTAL_DISTANCE, CAR_LANE_CHANGE_SPEED*delta)
	if about(ABOUT_SENSITIVITY):
		car_x = lane * MAX_HORIZONTAL_DISTANCE
	Car.transform.origin.x = car_x
	
func about(off):
	return abs(abs(car_x)-abs(lane * MAX_HORIZONTAL_DISTANCE))<off

func _input(event):
	var mouse = Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	
	if event is InputEventMouseMotion:
		var rel = event.relative.x
		if mouse:
			input_delta += rel
