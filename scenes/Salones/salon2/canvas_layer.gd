extends CanvasLayer

@onready var label = $Panel/MarginContainer/Label

var dialogos = [
	"Ahora tenemos que buscar el expediente de un alumno.",
	"Revisemos el salón con cuidado.",
    "Seguro encontramos algo importante."
]

var index = 0
var velocidad = 0.03
var escribiendo = false

func _ready():
	mostrar_dialogo()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if escribiendo:
			# terminar texto instantáneo
			label.text = dialogos[index]
			escribiendo = false
		else:
			index += 1
			if index < dialogos.size():
				mostrar_dialogo()
			else:
				# 👇 AQUÍ DESAPARECE TODO
				$Panel.visible = false
				label.visible = false

func mostrar_dialogo():
	escribir_texto(dialogos[index])

func escribir_texto(texto):
	escribiendo = true
	label.text = ""
	
	for letra in texto:
		label.text += letra
		await get_tree().create_timer(velocidad).timeout
	
	escribiendo = false
