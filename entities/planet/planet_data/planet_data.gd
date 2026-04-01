extends Node
class_name PlanetData

var planet_name

#input
@export var inputs: Array[GlobalResources.RESOURCE]
@export var input_costs: Array[int]
@export var input_stored: Array[int]
var input_storage_maximum: int = 500

#production
@export var production_rate: float
var production_enabled: bool
var time: float

#output
@export var outputs: Array[GlobalResources.RESOURCE]
@export var output_quantity: Array[int]
@export var output_stored: Array[int]
var output_storage_maximum: int = 500


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	production_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if production_enabled:
		var index: int = 0
		for input in inputs:
			if input_stored[index] - input_costs[index] < 0:
				production_enabled = false
				break
			else:
				index += 1
		if time > production_rate:
			_produce()
			time = 0
		time += delta


func _produce() -> void:
	print("we are producing")
	var index: int = 0
	#this function will only be entered when both input storages are greater than input cost.
	for input in inputs:
		input_stored[index] -= input_costs[index]
		index += 1

	index = 0
	for output in outputs:
		if output_stored[index] + output_quantity[index] < output_storage_maximum:
			output_stored[index] += output_quantity[index]
		index += 1

func emit_sig_send_planet_data() -> void:
	if GlobalResources.current_planet_select != planet_name:
		GlobalResources.current_planet_select = planet_name
		GlobalResources.emit_sig_send_input_planet_data(inputs, input_stored)
		GlobalResources.emit_sig_send_output_planet_data(outputs, output_stored)
