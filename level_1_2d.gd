# получаем главный узел сцены
extends Node2D



# создание обычной переменной
var num = 5 


# @onready - создаёт переменную только после прогрузки сцены
@onready var label_start:Label = $Label
@onready var lab_slid = $Label_slider
# VSlider - ползунок 
@onready var slider:VSlider = $VSlider



func _process(delta: float) -> void:
	# получаем значение ползунка и выводим через label
	lab_slid.text = str(slider.value)



# нажатие кнопки присоединил через узел
func _on_button_pressed() -> void:
	#print("ok")
	#var num = 5
	#print(num)
	#num = "2"
	#num += 1


	# рандом
	var rand_int = randi_range(1,10)
	var rand_float = randf_range(1,10)
	#print(rand_int)
	#print(rand_float)
	

	# получаем другой узел
	#var but_2 = get_node("Button2")
	var but_2:Button = get_node("Button2")
	# меняем ему координаты 
	but_2.position.x = 800
	but_2.position.y = 50
	
	
	
	# TextEdit - ввод текста
	#var inp_text = get_node("TextEdit")
	var inp_text:TextEdit = $TextEdit
	# получаем введённый текст
	print(inp_text.text)
	#print(inp_text.placeholder_text)
	
	
	# меняем текст label
	#print(label_start.text)
	label_start.text = inp_text.text
	

	# меняем координаты label
	label_start.position.y = int(inp_text.text)
	
	


# редактирование текста в TextEdit присоединил через узел
func _on_text_edit_text_changed() -> void:
	var but_2:Button = $Button2
	var inp_text:TextEdit = $TextEdit
	but_2.text = inp_text.text
	
	
	

# нажатие CheckButton присоединил через узел
func _on_check_button_pressed() -> void:

	# CheckButton - переключатель
	var check_but:CheckButton = $CheckButton
	# получаем положение CheckButton
	print(check_but.button_pressed)
	
	var but_1:Button = $Button
	
	# получаем фон другой кнопки
	var new_style = StyleBoxFlat.new()
	if(check_but.button_pressed):
		new_style.bg_color = "#FDE910"
	else:
		new_style.bg_color = "#FC2847"
		
	but_1.set("theme_override_styles/normal" , new_style)
