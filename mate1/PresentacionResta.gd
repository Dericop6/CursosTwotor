# PresentacionResta.gd

extends Control

const COURSES_LOCAL_BASE_PATH = "user://CursosTwotor/"
const CURRENT_COURSE_NAME = "mate1"

func _ready():	
	var btn_practicar = get_node("VBoxContainer/HBoxContainer/BtnPracticar")
	if btn_practicar:
		btn_practicar.pressed.connect(func():
			var practica_scene_path = COURSES_LOCAL_BASE_PATH + CURRENT_COURSE_NAME + "/PracticaResta.tscn"
			print("Intentando cambiar a escena de práctica:", practica_scene_path)
			get_tree().change_scene_to_file(practica_scene_path)
		)
	else:
		print("Error: Botón BtnPracticar no encontrado en PresentacionResta.gd")

	var btn_retroceder = get_node("VBoxContainer/HBoxContainer/BtnRetroceder")
	if btn_retroceder:
		btn_retroceder.pressed.connect(func():
			print("Volviendo a la pantalla de Cursos.")
			# Para volver a la pantalla de Cursos, necesitas que el Main.gd la cargue.
			# La forma más limpia es que el nodo Main tenga una función para esto.
			# Por ahora, puedes intentar cargar directamente la CursosScreen, pero lo ideal es que Main lo gestione.
			# get_tree().change_scene_to_file("res://UI/CursosScreen.tscn") # Esto cargaría la pantalla de cursos
			# O mejor, si main.gd está gestionando las pantallas, podrías hacer:
			var main_node = get_tree().get_root().get_node("Main")
			if main_node:
				main_node.cargar_pantalla("cursos")
			else:
				print("Error: Nodo Main no encontrado para cargar pantalla de cursos.")
		)
	else:
		print("Error: Botón BtnRetroceder no encontrado en PresentacionResta.gd")
