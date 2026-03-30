extends Node

#Global Var's

#signals
signal sig_change_gamestate(_new_state: String)

#emits
func emit_sig_change_gamestate(_new_state: String) -> void:
	sig_change_gamestate.emit(_new_state)