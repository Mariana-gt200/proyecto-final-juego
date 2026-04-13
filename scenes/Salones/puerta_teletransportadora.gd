extends Area2D

# Esta línea crea una casilla en el Inspector para elegir el salón
@export_file("*.tscn") var escena_destino

func _on_body_entered(body: Node2D):
	# Verificamos que sea la psicologa (minúscula como la tienes)
	if body.name == "psicologa":
		if escena_destino != "":
			print("Cambiando a escena: ", escena_destino)
			# USAMOS EL COMANDO DIRECTO:
			get_tree().change_scene_to_file(escena_destino)
		else:
			print("¡Error! No has elegido a qué salón va esta puerta en el Inspector")
