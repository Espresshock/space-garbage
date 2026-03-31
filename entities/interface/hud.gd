extends Control

@export var departure: Label
@export var destination: Label
@export var launch_button: Button

var can_launch: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalFlightManager.sig_update_departure_hud.connect(update_departure_label)
	GlobalFlightManager.sig_update_destination_hud.connect(update_destination_label)
	pass # Replace with function body.


func update_departure_label(_name: String) -> void:
	departure.text = _name
	check_launch_button()

func update_destination_label(_name: String) -> void:
	destination.text = _name
	check_launch_button()

func check_launch_button() -> void:
	if destination.text == " ":
		launch_button.visible = false
		can_launch = false
		return
	elif departure.text == " ":
		launch_button.visible = false
		can_launch = false
		return
	elif destination.text != " " && departure.text != " ": 
		launch_button.visible = true
		can_launch = true




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_launch_button_up() -> void:
	GlobalFlightManager.emit_sig_launch_button_pressed()
