extends Control

#tools
@export var resource_label_scene: PackedScene

#planet information
var planet_name: String
@export var inputs_vbox: VBoxContainer
@export var outputs_vbox: VBoxContainer

#flight plan
@export var departure: Label
@export var destination: Label
@export var launch_button: Button

var can_launch: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalFlightManager.sig_update_departure_hud.connect(update_departure_label)
	GlobalFlightManager.sig_update_destination_hud.connect(update_destination_label)
	GlobalResources.sig_send_input_planet_data.connect(_process_input_data)
	GlobalResources.sig_send_output_planet_data.connect(_process_output_data)
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

func _process_input_data(_resources: Array[GlobalResources.RESOURCE], _storage: Array[int]) -> void:
	var index: int = 0
	if inputs_vbox.get_child_count() > 1:
		for container in inputs_vbox.get_children():
			if index != 0:
				container.queue_free()
			index += 1
		index = 0

	for resource in _resources:
		var new_resource_label: HBoxContainer = resource_label_scene.instantiate()
		inputs_vbox.add_child(new_resource_label)
		new_resource_label.set_labels(resource, _storage[index])
		index += 1

func _process_output_data(_resources: Array[GlobalResources.RESOURCE], _storage: Array[int]) -> void:
	var index: int = 0
	if outputs_vbox.get_child_count() > 1:
		for container in outputs_vbox.get_children():
			if index != 0:
				container.queue_free()
			index += 1
		index = 0

	for resource in _resources:
		var new_resource_label: HBoxContainer = resource_label_scene.instantiate()
		outputs_vbox.add_child(new_resource_label)
		new_resource_label.set_labels(resource, _storage[index])
		index += 1
	pass

func draw_selected_planet_data() -> void:
	# update all the correct lables with data supplied using the signal.
	# each signal goes to a function which independantly sets the correct input / output variables.

	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_launch_button_up() -> void:
	GlobalFlightManager.emit_sig_launch_button_pressed()
