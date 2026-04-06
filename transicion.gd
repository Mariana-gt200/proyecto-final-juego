extends CanvasLayer

var anim : AnimationPlayer

func _ready():
	# Buscamos cualquier hijo que sea un AnimationPlayer
	for hijo in get_children():
		if hijo is AnimationPlayer:
			anim = hijo
			break
	
	if anim == null:
		print("❌ ERROR: No encontré el AnimationPlayer dentro de Transicion")

func cambiar_escena(ruta_escena: String):
	if anim:
		anim.play("fundido")
		await anim.animation_finished
	
	# El cambio de escena diferido para evitar errores de física
	get_tree().call_deferred("change_scene_to_file", ruta_escena)
	
	if anim:
		# Esperamos un microsegundo para que la nueva escena cargue
		await get_tree().create_timer(0.1).timeout
		anim.play("aparecer")
