# получаем главный узел сцены
extends Node2D



# создание обычной переменной
var num = 5 
@onready var label_start:Label = $Label



# нажатие кнопки присоединил через узел
func _on_button_pressed() -> void:
	var rand_int = randi_range(1,10)
	var rand_float = randf_range(1,10)
	#print(rand_int)
	#print(rand_float)
	#print("ok")
	#var num = 5
	#print(num)
	#num = "2"
	#num += 1
	
	# получаем другой узел
	#var but_2 = get_node("Button2")
	var but_2:Button = get_node("Button2")
	but_2.position.x = 800
	but_2.position.y = 50
	
	
	
	#var inp_text = get_node("TextEdit")
	var inp_text:TextEdit = $TextEdit
	print(inp_text.text)
	#print(inp_text.placeholder_text)
	
	
	#var label_start:Label = $Label
	#print(label_start.text)
	label_start.text = inp_text.text
	
	
	label_start.position.y = int(inp_text.text)
	
	
	
	
	
