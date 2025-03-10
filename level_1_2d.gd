# получаем главный узел сцены
extends Node2D


@onready var check_button = $CanvasLayer/CheckButton

func _on_check_button_pressed() -> void:
	print(check_button.button_pressed)
	if(check_button.button_pressed):
		# игра открывается в полно экраном режиме
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		# игра открывается в оконном режиме
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
