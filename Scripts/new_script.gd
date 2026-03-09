extends CharacterBody2D

# 1. Ajustes del motor (Constantes)
const WALK_SPEED = 150.0
const SPRINT_SPEED = 300.0
const ACCEL = 800.0
const FRICTION = 1000.0

# Busca al nodo HIJO que se encarga de las animaciones
@onready var anim_player = $AnimationPlayer

func _physics_process(delta):
	# 2. Lógica del Sprint (Se reinicia a WALK_SPEED en cada frame)
	var current_speed = WALK_SPEED
	if Input.is_action_pressed("sprint"):
		current_speed = SPRINT_SPEED

	# 1. Intentar usar tus acciones personalizadas
	var direction = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	
	# 2. Si las personalizadas no responden (dan 0), usar las flechas por defecto
	if direction == Vector2.ZERO:
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# 3. Aplicar velocidad
	velocity = direction * current_speed

	# 4. Control de animaciones (con protección de errores)
	if direction != Vector2.ZERO:
		if anim_player:
			anim_player.play("caminar")
	else:
		if anim_player:
			anim_player.stop()

	move_and_slide()
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
