extends CharacterBody2D

# 1. Ajustes del motor (Constantes)
const WALK_SPEED = 150.0
const SPRINT_SPEED = 300.0
const ACCEL = 800.0
const FRICTION = 1000.0

@onready var anim_player = $psicologa

func _physics_process(delta):
	# 2. Lógica del Sprint (Se reinicia a WALK_SPEED en cada frame)
	var current_speed = WALK_SPEED
	if Input.is_action_pressed("sprint"):
		current_speed = SPRINT_SPEED

	# 3. Obtener dirección
	var direction = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	
	# 4. Aplicar la velocidad física
	if direction != Vector2.ZERO:
		# ¡IMPORTANTE! Usamos 'current_speed' para que el sprint funcione
		velocity = velocity.move_toward(direction * current_speed, ACCEL * delta)
		anim_player.play("caminar")
		
		# Ajustamos el ritmo de los pies según la velocidad
		anim_player.speed_scale = 1.8 if current_speed == SPRINT_SPEED else 1.0
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		anim_player.stop()

	move_and_slide()
