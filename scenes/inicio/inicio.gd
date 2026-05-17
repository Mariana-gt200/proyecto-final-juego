extends Node2D
@onready var musica=$AudioStreamPlayer
@onready var botones=$AudioStreamPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	musica.play()
	MusicManager.stop_music()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jugar_pressed() -> void:
	botones.play()
	await botones.finished
	get_tree().change_scene_to_file("res://scenes/inicio/salaDirector.tscn")
	


func _on_salir_pressed() -> void:
	botones.play()
	await botones.finished
	get_tree().quit()
	
