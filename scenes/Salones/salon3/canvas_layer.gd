extends CanvasLayer

@onready var label = $Panel/MarginContainer/Label

# Diálogo automático del expediente (el que aparecía solo)
var dialogos_expediente = [
	"Ahora tenemos que buscar el expediente de un alumno.",
	"Revisemos el salón con cuidado.",
	"Seguro encontramos algo importante.",
	"¡Mira allá hay algo!"
]

# Diálogo del personaje (con I)
var dialogos_personaje = [
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

var dialogos_actuales = []
var index = 0
var velocidad = 0.03
var escribiendo = false
var dialogo_activo = false
var modo_automatico = true  # True = expediente automático, False = diálogo con I

func _ready():
	# Al empezar, mostramos el expediente automáticamente
	iniciar_dialogo_expediente()

func _input(event):
	# Avanzar diálogo con Espacio (o cualquier tecla que quieras)
	if event.is_action_pressed("ui_accept") and dialogo_activo:  # ui_accept es Espacio por defecto
		if escribiendo:
			label.text = dialogos_actuales[index]
			escribiendo = false
		else:
			siguiente_linea()
	
	# Diálogo extra con tecla I (solo si no hay diálogo activo, o se puede superponer)
	if event.is_action_pressed("interactuar2") and not dialogo_activo:
		iniciar_dialogo_personaje()

func siguiente_linea():
	index += 1
	
	if index >= dialogos_actuales.size():
		# Terminó el diálogo
		visible = false
		dialogo_activo = false
		
		# Si era el automático y terminó, ya está.
		# Si quieres que al terminar el expediente se pueda iniciar el de I, no hay problema.
		return
	
	mostrar_dialogo()

func iniciar_dialogo_expediente():
	if dialogo_activo:
		return  # Ya hay un diálogo mostrándose
	
	modo_automatico = true
	dialogos_actuales = dialogos_expediente
	index = 0
	visible = true
	dialogo_activo = true
	mostrar_dialogo()

func iniciar_dialogo_personaje():
	if dialogo_activo:
		return  # Ya hay un diálogo, no interrumpir
	
	modo_automatico = false
	dialogos_actuales = dialogos_personaje
	index = 0
	visible = true
	dialogo_activo = true
	mostrar_dialogo()

func mostrar_dialogo():
	escribir_texto(dialogos_actuales[index])

func escribir_texto(texto):
	escribiendo = true
	label.text = ""
	
	for letra in texto:
		label.text += letra
		await get_tree().create_timer(velocidad).timeout
	
	escribiendo = false
