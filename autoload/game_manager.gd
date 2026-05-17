extends Node

var is_dialogue_active:bool=false
var conocio_al_director:bool=false
var conocio_a_jessica:bool=false
var conocio_a_carlos:bool=false
var conocio_a_erika:bool=false
var respuesta_jessica:bool=false
var respuesta_carlos:bool=false
var respuesta_erika:bool=false
var mission_actual=0

func completar_misiones():
	mission_actual+=1
	
func misiones_estudiantes():
	mission_actual-=1


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
