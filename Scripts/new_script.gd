extends CharacterBody2D

# 🏃 Variables de movimiento (puedes cambiarlas para que camine más lento o rápido)
const SPEED = 150.0 
const ACCEL = 800.0  
const FRICTION = 1000.0 

# Definimos las dos velocidades arriba en el script
const WALK_SPEED = 150.0
const SPRINT_SPEED = 300.0

# Dentro de la función, decidimos cuál usar:
var current_speed = WALK_SPEED

# 🎬 Referencia al AnimationPlayer (importante para que el código "vea" tus 12 frames)
@onready var anim_player = $AnimationPlayer

func _physics_process(delta):
	# 1. Detectar dirección (basado en lo que pusiste en el Input Map)
	var direction = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	
	# 2. Aplicar movimiento físico
	if Input.is_action_pressed("sprint"):
		current_speed = SPRINT_SPEED

	if direction != Vector2.ZERO:
		# Si hay movimiento, aceleramos hacia la dirección
		velocity = velocity.move_toward(direction * SPEED, ACCEL * delta)
		# ¡Aquí activamos la animación de caminar!
		anim_player.play("caminar")
	else:
		# Si no tocamos nada, frenamos con fricción
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		# Si se detiene, paramos la animación
		anim_player.stop()

	# 3. Mover al personaje y detectar choques con paredes
	move_and_slide()
