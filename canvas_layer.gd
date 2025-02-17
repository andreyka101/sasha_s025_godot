extends CanvasLayer


# HSlider - ползунок 
@onready var slider_audio:HSlider = $HSlider
# AudioServer - хранилище аудио шин
# AudioServer.get_bus_index(n) - получаем индекс шины по имени n
var bus_index = AudioServer.get_bus_index("Master")



func _on_h_slider_drag_ended(value_changed: bool) -> void:

	# получаем значение ползунка
	#print(slider_audio.value)

	# индекс шины
	#print(bus_index)

	# linear_to_db - преобразовывает float в децибелы
	#print(linear_to_db(0.5))
	print(linear_to_db(slider_audio.value))
	
	
	# AudioServer.set_bus_volume_db - меняем громкость шины по индексу
	AudioServer.set_bus_volume_db(bus_index , linear_to_db(slider_audio.value))
