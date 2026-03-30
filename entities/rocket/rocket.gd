extends Node2D

var rigid: RigidBody2D

#Tween from start location to random off screen location
#if spawn is positive y axis; endpoint should always be positive x point
#if spawn is negative y axis; endpoint should always be positive y point
#not a linear tween but a rubberband effect.
#want to achieve tween with a curve preferably; rotating sprite toward curve endpoint

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# launch: tween to 1 constant force
# breakaway; accellerate to 5


func generate_random_target_vector() -> Vector2:
	var target_vector = Vector2(0,0)
	if position.y < 0:
		target_vector.y = randf_range(-1600,-3000)
	else:
		target_vector.y = randf_range(1600,3000)

	target_vector.x = randf_range(-2500,2500)
	return target_vector

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#	var rocket_tween: Tween = get_tree().create_tween()
	#var rocket_target: Vector2 = generate_random_target_vector()
	#global_rotation = rocket_target.angle_to_point(position)
	#rocket_tween.set_ease(Tween.EaseType.EASE_IN)
	#rocket_tween.tween_property(self, "position", rocket_target, 25)
	#rocket_tween.set_trans(Tween.TransitionType.TRANS_ELASTIC)