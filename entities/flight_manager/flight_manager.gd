extends Node2D

@export var rocket: PackedScene

var departure_planet: Planet = null
var destination_planet: Planet = null

func _ready() -> void:
	GlobalFlightManager.sig_select_planet.connect(handle_planet_select)
	GlobalFlightManager.sig_launch_button_pressed.connect(launch_rocket)
	pass

func reset_departure_destination() -> void:
	pass

func launch_rocket() -> void:
	if departure_planet == null:
		return

	if destination_planet == null:
		return

	var new_rocket = rocket.instantiate()
	new_rocket.target = destination_planet
	get_parent().add_child(new_rocket)
	new_rocket.position = departure_planet.global_position
	clear_flightplan()
	pass

func clear_flightplan() -> void:
	departure_planet = null
	destination_planet = null
	GlobalFlightManager.emit_sig_update_destination_hud(" ")
	GlobalFlightManager.emit_sig_update_departure_hud(" ")

func handle_planet_select(_planet: Planet) -> void:
	if departure_planet != null && destination_planet != null:
		if destination_planet == _planet:
			destination_planet = null
			GlobalFlightManager.emit_sig_update_destination_hud(" ")
	elif departure_planet != null && destination_planet == null && _planet != departure_planet:
		destination_planet = _planet
		print("Destination: " + str(destination_planet.planet_name))
		GlobalFlightManager.emit_sig_update_destination_hud(destination_planet.planet_name)
	elif departure_planet == null:
		departure_planet = _planet
		print("Departure from: " + str(departure_planet.planet_name))
		GlobalFlightManager.emit_sig_update_departure_hud(departure_planet.planet_name)
	elif departure_planet == _planet:
		departure_planet = null
		GlobalFlightManager.emit_sig_update_departure_hud(" ")
