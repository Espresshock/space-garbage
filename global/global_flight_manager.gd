extends Node

signal sig_select_planet(_planet: Planet)

signal sig_update_departure_hud(_name: String)
signal sig_update_destination_hud(_name: String)

signal sig_launch_button_pressed


func emit_sig_select_planet(_planet: Planet) -> void:
	sig_select_planet.emit(_planet)

#HUD SIGNALS

func emit_sig_update_departure_hud(_name: String) -> void:
	sig_update_departure_hud.emit(_name)

func emit_sig_update_destination_hud(_name: String) -> void:
	sig_update_destination_hud.emit(_name)

#ROCKET SIGNALS

func emit_sig_launch_button_pressed() -> void:
	sig_launch_button_pressed.emit()