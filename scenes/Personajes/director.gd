extends Area2D

@onready var exclamation_mark= $ExclamationMark

var is_psicologa_close=false
const PSICOLOGA_EJEMPLO=preload("res://dialogos/psicologaEjemplo.dialogue")



func _physics_process(delta: float) -> void:
	if is_psicologa_close and Input.is_action_just_pressed("interactuar"):
		DialogueManager.show_dialogue_balloon(PSICOLOGA_EJEMPLO)


func _on_area_entered(area: Area2D) -> void:
	exclamation_mark.visible= true
	is_psicologa_close=true


func _on_area_exited(area: Area2D) -> void:
	exclamation_mark.visible= false
	is_psicologa_close=false
