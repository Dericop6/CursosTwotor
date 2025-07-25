extends Control

@onready var entrada = $VBoxContainer/LineEdit
@onready var resultado = $VBoxContainer/LblResultado

const COURSES_LOCAL_BASE_PATH = "user://CursosTwotor/"
const CURRENT_COURSE_NAME = "mate1"

func _ready():
	var btn_revisar = $VBoxContainer/BtnRevisar # Asumiendo que es hijo directo de VBoxContainer
	if btn_revisar:
		btn_revisar.pressed.connect(verificar)
	else:
		print("Error: Botón BtnRevisar no encontrado en PracticaResta.gd")

	var btn_retroceder = get_node("VBoxContainer/BtnRetroceder")
	if btn_retroceder:
		btn_retroceder.pressed.connect(func():
			print("Volviendo a la pantalla de Cursos.")
			var main_node = get_tree().get_root().get_node("Main")
			if main_node:
				main_node.cargar_pantalla("cursos")
			else:
				print("Error: Nodo Main no encontrado para cargar pantalla de cursos.")
		)
	else:
		print("Error: Botón BtnRetroceder no encontrado en PracticaResta.gd")


func verificar():
	if entrada.text == "3":
		resultado.text = "¡Correcto!"
	else:
		resultado.text = "Intenta de nuevo."
