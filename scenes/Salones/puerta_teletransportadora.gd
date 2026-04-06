extends Area2D

# 🌍 Esta línea crea una casilla en el Inspector para elegir el salón
@export_file("*.tscn") var escena_destino

# Esta función se activará cuando conectemos la señal en el siguiente paso
func _on_body_entered(body: Node2D):
	# Verificamos que sea la psicóloga y que hayamos elegido un destino
	if body.name == "psicologa":
		if escena_destino != "":
			# Llamamos al Autoload "Transicion" y su función
			Transicion.cambiar_escena(escena_destino)
		else:
			print("¡Error! No has elegido a qué salón va esta puerta en el Inspector")
