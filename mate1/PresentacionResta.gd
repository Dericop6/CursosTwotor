extends Control

func _ready():
	get_node("VBoxContainer/HBoxContainer/BtnPracticar").pressed.connect(func():
		get_tree().change_scene_to_file("res://Cursos/Matematicas/Tema2/PracticaResta.tscn"))

	get_node("VBoxContainer/HBoxContainer/BtnRetroceder").pressed.connect(func():
		get_tree().change_scene_to_file("res://Cursos/Matematicas/CursoMatematicas.tscn"))
