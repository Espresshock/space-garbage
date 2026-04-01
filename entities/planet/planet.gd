extends Node2D
class_name Planet

@onready var sprite: AnimatedSprite2D = $PlanetSprite
@export var planet_data: PlanetData


var planet_name: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init_planet(_name: String) -> void:
	planet_name = _name
	sprite.animation = planet_name

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		print("Clicked!")
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				planet_data.planet_name = planet_name
				planet_data.emit_sig_send_planet_data()
			MOUSE_BUTTON_RIGHT:
				GlobalFlightManager.emit_sig_select_planet(self)
