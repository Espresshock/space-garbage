extends Node2D

@export var orbit_modifier: Array[float]
@export var orbits: Array[Node]
@export var planet_nodes: Array[Planet]
@export var star: AnimatedSprite2D

var planet_names: Array[String] = ["Planet_A", "Planet_B", "Planet_C", "Planet_D", "Planet_E", "Planet_F"]

var rotationspeed: float = 0.001
var index: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for planet in planet_nodes:
		planet.init_planet(planet_names[index])
		index += 1
	star.play()
	index = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for orbit in orbits:
		orbit.rotation += rotationspeed * orbit_modifier[index]
		index += 1
	
	index = 0
	pass
