
# получаем узел сцены
extends Button



# нажатие кнопки присоединил через узел
func _on_pressed() -> void:

	# меняем координаты
	self.position.y += 20
	position.x = 10

	# меняем размер
	size.x = 500
	print(size.x)
	
	# меняем точку вращения
	pivot_offset.x = size.x / 2
	pivot_offset.y = size.y / 2

	# крутим
	rotation += 1
	
	# меняем текст кнопки
	#text = "hello"
	text = str(position.y)
	
	#for i in range(10):
		#print(i)
	
	# два способа изменить цвет текста
	set("theme_override_colors/font_color" , "#00FFFF")
	add_theme_color_override("font_focus_color" ,"#8B00FF")

	# меняем style
	var new_style = StyleBoxFlat.new()
	new_style.bg_color = "#FF7518"
	set("theme_override_styles/normal" , new_style)
	
	
