extends CharacterBody2D

# 1. Ajustes del motor
const WALK_SPEED = 150.0
const SPRINT_SPEED = 300.0
const ACCEL = 800.0
const FRICTION = 1000.0

@onready var anim_player = $AnimationPlayer
@onready var sprite = $Sprite2D

func _physics_process(delta):
	# 2. Lógica de dirección (WASD o Flechas)
	var direction = Input.get_vector("mover_izquierda", "mover_derecha", "mover_arriba", "mover_abajo")
	if direction == Vector2.ZERO:
		direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	# 🔄 Voltear sprite según dirección horizontal
	if direction.x < 0:
		sprite.flip_h = true   # Voltea a la izquierda
	elif direction.x > 0:
		sprite.flip_h = false  # Voltea a la derecha

	# 3. Lógica del Sprint
	var target_speed = WALK_SPEED
	if Input.is_action_pressed("sprint"):
		target_speed = SPRINT_SPEED

	# 4. Aplicar la velocidad con aceleración/fricción
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * target_speed, ACCEL * delta)
		
		# Control de animación seguro
		if anim_player:
			anim_player.play("caminar")
			anim_player.speed_scale = 1.8 if target_speed == SPRINT_SPEED else 1.0
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
		# Animación de idle
		if anim_player:
			anim_player.play("idle")

	# 5. Ejecutar el movimiento
	move_and_slide()