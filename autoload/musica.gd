extends Node
# Called when the node enters the scene tree for the first time.
var current_track = null

func play_music(stream):
	if current_track == stream:
		return # ya está sonando, no reiniciar
	
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer.stream = stream
	$AudioStreamPlayer.play()
	current_track = stream

func stop_music():
	$AudioStreamPlayer.stop()
	current_track = null
