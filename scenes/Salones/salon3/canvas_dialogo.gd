extends CanvasLayer

@onready var label = $Panel/MarginContainer/Label

var dialogo_personaje = [
	"Psicóloga: Hola Carlos, ¿cómo estás hoy?",
	"Carlos: Bien... supongo.",
	"Psicóloga: He notado que has estado un poco tenso en clase.",
	"Carlos: No es nada. Los profes me tienen manía.",
	"Psicóloga: ¿Y en casa? ¿Todo bien?",
	"Carlos: (Se toca los brazos inconscientemente) ...Sí, normal.",
	"Psicóloga: Vi tus calificaciones de matemáticas. ¿Necesitas ayuda?",
	"Carlos: No sirve de nada. Pase lo que pase, igual...",
	"Carlos: (Suspira) Da igual, no importa.",
	"Psicóloga: Carlos, quiero que sepas que puedes confiar en mí.",
	"Psicóloga: Esto es un espacio seguro. No estás solo.",
	"Carlos: (Mira al suelo, en silencio)... Tal vez después.",
	"Psicóloga: Está bien. Cuando quieras, aquí estoy."
]

var indice = 0
var escribiendo = false

func _ready():
	visible = false
	add_to_group("dialogo_sistema")
	print("✅ CanvasDialogo listo en escena principal")

func mostrar_dialogo_personaje():
	print("✅ Mostrando diálogo del personaje")
	if visible:
		return
	indice = 0
	visible = true
	_mostrar_linea()

func _mostrar_linea():
	if indice >= dialogo_personaje.size():
		visible = false
		return
	
	escribiendo = true
	label.text = ""
	for letra in dialogo_personaje[indice]:
		label.text += letra
		await get_tree().create_timer(0.03).timeout
	escribiendo = false

func _input(event):
	if visible and event.is_action_pressed("ui_accept"):
		if escribiendo:
			label.text = dialogo_personaje[indice]
			escribiendo = false
		else:
			indice += 1
			_mostrar_linea()
