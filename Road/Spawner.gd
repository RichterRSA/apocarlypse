extends Node3D

const PLAYER_SCENE = "res://Assets/DevCar.tscn"
const PLAYER_RESET_TRIGGER = 20.0

@export var road_pieces = 1

var spawned_road_pieces = Array()
var player_instance: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Spawning player")
	var player = load(PLAYER_SCENE)
	player_instance = player.instantiate()
	player_instance.set_name("Player")
	(player_instance as Node3D).rotate_x(-PI/2)
	add_child(player_instance)
	
	for i in 2:
		spawn_random(20.0*i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset = player_instance.transform.origin.y
	if -offset>PLAYER_RESET_TRIGGER:
		print("reset, spawn new")
		spawn_random(2*PLAYER_RESET_TRIGGER)
		for obj in get_children():
			(obj as Node3D).transform.origin.y -= offset

func spawn_random(offset):
	print("Spawning res://Roads/"+str(1)+".tscn")
	var scene = load("res://Roads/"+str(1)+".tscn")
	var scene_instance = scene.instantiate()
	(scene_instance as Node3D).translate(-Vector3.UP*offset)
	(scene_instance as Node3D).rotate_x(-PI/2)
	add_child(scene_instance)
