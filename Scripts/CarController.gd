extends Node3D

const ABOUT_SENSITIVITY = 0.0025
const MAX_HORIZONTAL_DISTANCE = 0.5
const CAR_MOVE_SENSITIVITY = 40
const CAR_SPEED = 5.0
const CAR_LANE_CHANGE_SPEED = 10.0

var Car: Node3D
var lane: float = -MAX_HORIZONTAL_DISTANCE 
var car_x: float
var can_move: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Car = get_node("Car")
	car_x = lane * MAX_HORIZONTAL_DISTANCE

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if can_move:
			lane = -lane
		can_move = false
	else:
		can_move = true
	
	handle_car_horizontal(delta)
	
	Car.get_parent().translate(Vector3.FORWARD*CAR_SPEED*delta)

func handle_car_horizontal(delta):
	if car_x < lane:
		car_x += CAR_LANE_CHANGE_SPEED * delta
		if car_x >= lane:
			car_x = lane
	elif car_x > lane:
		car_x -= CAR_LANE_CHANGE_SPEED * delta
		if car_x <= lane:
			car_x = lane
			
	print("car_x: ", car_x)
	
	Car.transform.origin.x = car_x
	
func about(off):
	return abs(abs(car_x)-abs(lane * MAX_HORIZONTAL_DISTANCE))<off
