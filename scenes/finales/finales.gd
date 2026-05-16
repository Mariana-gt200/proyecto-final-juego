extends CanvasLayer
var conoce_jessica=GameManager.conocio_a_jessica
var conoce_carlos=GameManager.conocio_a_carlos
var conoce_erika=GameManager.conocio_a_erika
var respuesta_jessica=GameManager.respuesta_jessica
var respuesta_carlos=GameManager.respuesta_carlos
var respuesta_erika=GameManager.respuesta_erika



# Called when the node enters the scene tree for the first time.
func entrar_a_finales():
	if conoce_carlos and conoce_erika and conoce_jessica:
		if respuesta_carlos and respuesta_erika and respuesta_jessica== true:
			get_tree().change_scene_to_file("res://scenes/finales/finalBueno.tscn")
		elif respuesta_carlos or respuesta_erika or respuesta_jessica==true:
			get_tree().change_scene_to_file("res://scenes/finales/finalMedio.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/finales/finalMalo.tscn")
