extends Area2D

@export var nombre_alumno : String = "Nombre"
@export_multiline var informacion : String = "Datos del alumno..."
@onready var abrir=$abrir


var en_rango = false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	$CanvasLayer/Panel.visible = false # Aseguramos que empiece cerrado

func _on_body_entered(body):
	if body.name == "psicologa":
		en_rango = true
		print("✅ Detectada psicóloga cerca de: ", nombre_alumno)

func _on_body_exited(body):
	if body.name == "psicologa":
		en_rango = false
		$CanvasLayer/Panel.visible = false

func _process(_delta):
	if en_rango and Input.is_action_just_pressed("interactuar"): 
		abrir.play()
	
		if $CanvasLayer/Panel.visible:
			$CanvasLayer/Panel.visible = false
			
			print("--- EXPEDIENTE CERRADO ---")
		else:
			abrir_expediente()

func abrir_expediente():
	print("--- EXPEDIENTE ABIERTO ---")
	# Fíjate que el símbolo $ esté pegado a la palabra CanvasLayer
	$CanvasLayer/Panel/RichTextLabel.text = "[color=black]" + "Estudiantes:  \n Jessica - 9A\n Carlos - 10F\n Erika - 11D"+ "[/color]"
	$CanvasLayer/Panel.visible = true
	if GameManager.mission_actual==1:
			GameManager.completar_misiones()
