extends Control

@onready var entrada = $VBoxContainer/LineEdit
@onready var resultado = $VBoxContainer/LblResultado

# Referencia al nodo Main para la navegación
var main_node: Node

# Nombre del curso al que pertenece esta escena (ej. "mate1")
const CURRENT_COURSE_NAME = "mate1"

func _ready():
	# Obtener referencia al nodo Main
	main_node = get_tree().get_root().get_node("Main")
	if main_node == null:
		print("Error: No se pudo encontrar el nodo 'Main' en PracticaSuma.gd.")
		return

	# Conectar el botón "Revisar"
	# ¡IMPORTANTE! Revisa tu .tscn para confirmar la ruta exacta de este botón.
	# Si está directamente en VBoxContainer, usa "$VBoxContainer/BtnRevisar"
	var btn_revisar = $VBoxContainer/BtnRevisar # Ajusta esta ruta si es necesario
	if btn_revisar:
		btn_revisar.pressed.connect(verificar)
	else:
		print("Error: Botón BtnRevisar no encontrado en PracticaSuma.gd. Revisa la ruta.")


	# Conectar el botón "Retroceder"
	# Este botón debería llevar de vuelta a la pantalla de Cursos
	var btn_retroceder = get_node("VBoxContainer/BtnRetroceder") # Ajusta esta ruta si es necesario
	if btn_retroceder:
		btn_retroceder.pressed.connect(func():
			print("Volviendo a la pantalla de Cursos desde PracticaSuma.gd.")
			# Pide a main_node que cargue la pantalla de cursos
			main_node.cargar_pantalla("cursos")
		)
	else:
		print("Error: Botón BtnRetroceder no encontrado en PracticaSuma.gd. Revisa la ruta.")


func verificar():
	# Lógica específica de la práctica
	if entrada.text == "5": # Para PracticaSuma.gd
		resultado.text = "¡Correcto!"
	else:
		resultado.text = "Intenta de nuevo."
