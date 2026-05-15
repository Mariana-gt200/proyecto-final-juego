extends CanvasLayer
var pause_toggle=false


func _ready() -> void:
	self.visible=false
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausar"):
		pause_and_unpause()
		

func pause_and_unpause():
	pause_toggle=!pause_toggle
	get_tree().paused=pause_toggle
	self.visible=pause_toggle


func _on_reanudar_pressed() -> void:
	pause_and_unpause()


func _on_reiniciar_pressed() -> void:
	get_tree().reload_current_scene()


func _on_ir_al_inicio_pressed() -> void:
	get_tree().quit()
