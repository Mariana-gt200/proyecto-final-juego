extends Area2D

# Variables que verás en el Inspector de Godot
@export var nombre_alumno : String = "Nombre"
@export_multiline var informacion : String = "Datos del alumno..."

var en_rango = false

func _ready():
    # Conectamos las señales por código para que sea más fácil
    body_entered.connect(_on_body_entered)
    body_exited.connect(_on_body_exited)

func _on_body_entered(body):

    if body.name == "psicologa": # Verifica que tu personaje se llame exactamente así
        en_rango = true
        print("Cerca de: ", nombre_alumno, ". Presiona E")

func _on_body_exited(body):
    if body.name == "psicologa":
        en_rango = false

func _process(_delta):
    if en_rango and Input.is_action_just_pressed("interactuar"): 
        abrir_expediente()

func abrir_expediente():
    print("--- EXPEDIENTE ABIERTO ---")
    print("Alumno: ", nombre_alumno)
    print("Notas: ", informacion)
    # Aquí es donde más tarde haremos aparecer el cartelito visual