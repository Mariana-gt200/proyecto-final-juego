extends Area2D

# Referencia al gráfico del círculo
@onready var circle_sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	# El círculo inicia invisible
	circle_sprite.visible = false
	
	# Conectamos las señales de detección de cuerpos
	# Asegúrate que tu Jugador esté en una 'Layer' que este Area2D pueda detectar
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	# Verificamos si el cuerpo que entró es el jugador
	if body.is_in_group("psicologa") or body.name == "psicologa":
		
		circle_sprite.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("psicologa") or body.name == "psicologa":
		circle_sprite.visible = false
