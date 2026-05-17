extends Node2D
@onready var musica=$AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	musica.play()
	MusicManager.stop_music()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
func _on_salir_pressed() -> void:
	get_tree().quit()
func _on_ir_al_inicio_pressed():
	
	get_tree().change_scene_to_file("res://scenes/inicio/inicio.tscn")
	
