extends Control

var main_node: Node

const COURSES_LOCAL_BASE_PATH = "user://CursosTwotor/"
const CURRENT_COURSE_NAME = "mate1"

func _ready():
	# Obtener referencia al nodo Main
	main_node = get_tree().get_root().get_node("Main")
	if main_node == null:
		print("Error: No se pudo encontrar el nodo 'Main' en PresentacionSuma.gd.")
		return

	# Conectar el botón "Practicar"
	# ¡IMPORTANTE! Revisa tu .tscn para confirmar la ruta exacta de este botón.
	# Si está directamente en VBoxContainer, usa "$VBoxContainer/BtnPracticar"
	# Si está dentro de HBoxContainer, usa "$VBoxContainer/HBoxContainer/BtnPracticar"
	var btn_practicar = get_node("VBoxContainer/HBoxContainer/BtnPracticar") # Ajusta esta ruta si es necesario
	if btn_practicar:
		btn_practicar.pressed.connect(func():
			print("Navegando a PracticaSuma.tscn...")
			# Pide a main_node que cargue la escena de práctica
			main_node.load_downloaded_scene(CURRENT_COURSE_NAME, "PracticaSuma.tscn")
		)
	else:
		print("Error: Botón BtnPracticar no encontrado en PresentacionSuma.gd. Revisa la ruta.")


	# Conectar el botón "Retroceder"
	# Este botón debería llevar de vuelta a la pantalla de Cursos
	var btn_retroceder = get_node("VBoxContainer/HBoxContainer/BtnRetroceder") # Ajusta esta ruta si es necesario
	if btn_retroceder:
		btn_retroceder.pressed.connect(func():
			print("Volviendo a la pantalla de Cursos desde PresentacionSuma.gd.")
			# Pide a main_node que cargue la pantalla de cursos
			main_node.cargar_pantalla("cursos")
		)
	else:
		print("Error: Botón BtnRetroceder no encontrado en PresentacionSuma.gd. Revisa la ruta.")
