extends Control

@onready var entrada = $VBoxContainer/LineEdit
@onready var resultado = $VBoxContainer/LblResultado

func _ready():
	$VBoxContainer/BtnRevisar.pressed.connect(verificar)

	get_node("VBoxContainer/BtnRetroceder").pressed.connect(func():
		get_tree().change_scene_to_file("res://Cursos/Matematicas/CursoMatematicas.tscn"))

func verificar():
	if entrada.text == "5":
		resultado.text = "¡Correcto!"
	else:
		resultado.text = "Intenta de nuevo."
