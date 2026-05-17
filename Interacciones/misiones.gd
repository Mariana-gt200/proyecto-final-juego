extends Label
func _ready() -> void:
	text=get_mission_texto()


func _process(delta: float) -> void:
	text=get_mission_texto()
	
func get_mission_texto():
	match GameManager.mission_actual:
		0:
			return "Habla con el director"
		1:
			return "Busca el libro en la sala del director"
		2:
			return "Ve a buscar a cada salón un libro de un estudiante y revisalo"
		3: 
			return "Busca al estudiante en ese mismo salón de clases"
		4: 
			return "Sal de la escuela"
		
