extends Area2D

@onready var exclamation_mark= $ExclamationMark
@onready var hablar=$AudioStreamPlayer


var is_psicologa_close=false
const INICIO_DIALOGO=preload("res://dialogos/inicioDialogo.dialogue")

	


func _ready() -> void:
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)
	


func _on_area_entered(area: Area2D) -> void:
	exclamation_mark.visible= true
	is_psicologa_close=true


func _on_area_exited(area: Area2D) -> void:
	exclamation_mark.visible= false
	is_psicologa_close=false


func on_dialogue_started(dialogue):
	GameManager.is_dialogue_active=true
	
func on_dialogue_ended(dialogue):
	GameManager.is_dialogue_active=false


func _physics_process(delta: float) -> void:
	if is_psicologa_close and Input.is_action_just_pressed("hablar") and not GameManager.is_dialogue_active:
		hablar.play()
		await hablar.finished
		DialogueManager.show_dialogue_balloon(INICIO_DIALOGO)
		if GameManager.mission_actual==0:
			GameManager.completar_misiones()
		
		
