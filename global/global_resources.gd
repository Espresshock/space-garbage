extends Node

var current_planet_select: String


signal sig_send_input_planet_data(_inputs: Array[GlobalResources.RESOURCE], _input_stored: Array[int])
signal sig_send_output_planet_data(_outputs: Array[GlobalResources.RESOURCE], _output_stored: Array[int])

func emit_sig_send_input_planet_data(_inputs: Array[GlobalResources.RESOURCE], _input_stored: Array[int]) -> void:
    sig_send_input_planet_data.emit(_inputs, _input_stored)

func emit_sig_send_output_planet_data(_outputs: Array[GlobalResources.RESOURCE], _output_stored: Array[int]) -> void:
    sig_send_output_planet_data.emit(_outputs, _output_stored)

enum RESOURCE {WATER, GRAIN, CARBON, STEEL, FOOD, WORKER, ORE, SPACESHIP}