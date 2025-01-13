extends Node2D



# создание обычной переменной
var num = 5 




# нажатие кнопки присоединил через узел
func _on_button_pressed() -> void:
	print("ok")
	#var num = 5
	#print(num)
	#num = "2"
	num += 1
	
	
	#var but_2 = get_node("Button2")
	var but_2:BaseButton = get_node("Button2")
	but_2.position.x = 800
	but_2.position.y = 50
	
	
