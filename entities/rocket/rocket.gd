extends Node2D
class_name rocket

@export var target: Node
var max_rocket_speed: float = 0.5
var current_rocket_speed: float = 0
var flight_time: float = 0
#Tween from start location to random off screen location
#if spawn is positive y axis; endpoint should always be positive x point
#if spawn is negative y axis; endpoint should always be positive y point
#not a linear tween but a rubberband effect.
#want to achieve tween with a curve preferably; rotating sprite toward curve endpoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_rocket_speed = max_rocket_speed
	pass # Replace with function body.

func _process(delta: float) -> void:
	rotate_rocket(target, delta)
	pass

func lerp_to_target(_target: Node, _delta: float) -> void:
	if current_rocket_speed > 0.2 && flight_time < 5:
		current_rocket_speed -= 0.005
	elif flight_time > 5:
		current_rocket_speed += 0.005
	var target_pos: Vector2 = _target.global_position
	position = position.lerp(target_pos, _delta * current_rocket_speed)
	flight_time += _delta
	if position.distance_to(target_pos) < 75:
		self.queue_free()

func rotate_rocket(_target: Node, _delta: float) -> void:
	var v = global_position - _target.global_position
	var angle_to = transform.y.angle_to(v)
	rotate(sign(angle_to) * min(_delta* 0.9, abs(angle_to)))
	if angle_to < 0.25:
		lerp_to_target(target, _delta)
