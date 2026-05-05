extends Area2D

@onready var exclamation_mark= $ExclamationMark

var is_dialogue_active=false
var is_psicologa_close=false
const PSICOLOGA_EJEMPLO=preload("res://dialogos/psicologaEjemplo.dialogue")


func _ready() -> void:
	DialogueManager.dialogue_started.connect(on_dialogue_started)
	DialogueManager.dialogue_ended.connect(on_dialogue_ended)



func on_dialogue_started(dialogue):
	is_dialogue_active=true
	
func on_dialogue_ended(dialogue):
	is_dialogue_active=false


func _physics_process(delta: float) -> void:
	if is_psicologa_close and Input.is_action_just_pressed("interactuar") and not is_dialogue_active:
		DialogueManager.show_dialogue_balloon(PSICOLOGA_EJEMPLO)


func _on_area_entered(area: Area2D) -> void:
	exclamation_mark.visible= true
	is_psicologa_close=true


func _on_area_exited(area: Area2D) -> void:
	exclamation_mark.visible= false
	is_psicologa_close=false
